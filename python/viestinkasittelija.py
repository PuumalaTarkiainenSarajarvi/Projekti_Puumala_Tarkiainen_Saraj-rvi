import os
import sys
import datetime
import serial
import mysql.connector
import smtplib
import threading
import picamera

old_out = sys.stdout

class StampedOut:
    nl = True

    def write(self, x):    # ylikirjoitettu write-funktio
        if x == '\n':
            old_out.write(x)
            self.nl = True
        elif self.nl:
            old_out.write('<%s> %s' % (str(datetime.datetime.now().strftime("%H.%M.%S %d-%m-%Y")), x))
            self.nl = False
        else:
            old_out.write(x)

sys.stdout = StampedOut()

pingHost = "www.google.com"

mydb = mysql.connector.connect(
    host="***",
    user="***",
    passwd="***"
)

ser = serial.Serial("/dev/ttyACM0")

mycursor = mydb.cursor()
mycursor.execute("USE valvonta")

emailEnableFlag = 1

def enableEmail():
    print("##DEBUG: enabling email...")
    global emailEnableFlag
    emailEnableFlag = 1

def getEmailAddress():
    sql = "SELECT Email FROM loggingInfo WHERE ID = 1"
    mycursor.execute(sql)
    result = mycursor.fetchone()
    emailAddress = result[0]

    return emailAddress
    
def sendMail(cause):   
    server = smtplib.SMTP('smtp.gmail.com', 587)
    server.starttls()
    
    server.login("***@***", "***")

    alarmInfo = "Jarjestelman halytys laukesi koska "
    alarmStamp = datetime.datetime.now().strftime("%H.%M.%S %d-%m-%Y")

    userEmail = getEmailAddress()
    
    msg = alarmInfo + cause + alarmStamp
    server.sendmail("***@***", userEmail, msg)
    server.quit()

def checkAlarm():
    sql = "SELECT halytystila_on_off FROM halytys WHERE halytysID = 1"
    mycursor.execute(sql)
    result = mycursor.fetchone()
    alarmTriggered = result[0]
    
    if alarmTriggered == 1:
        return 1   
    else:
        return 0

def sendTemperature(line):
    sql = "INSERT INTO HourlyTemperature(ID, Temperature) VALUES (%s, %s)"
    val = (0, float(line))          # 0 = syotto uusimpaan indeksiin
    mycursor.execute(sql, val)
    mydb.commit()

def takePicture():
    print "##DEBUG: taking picture..."

    directory = "/var/www/public_html/valvonta/img/"
    date = datetime.datetime.now().strftime("%Y-%m-%d_%H-%M-%S")
    directory = directory + date + ".jpg"

    with picamera.PiCamera() as camera :
        camera.resolution = (640, 480)
        camera.capture(directory)

    print "##DEBUG: snap!"

while True:
    line = ser.readline()

    try:
        float(line)
        print("##DEBUG: temperature: " + line)
        sendTemperature(line)
        
    except ValueError:
        pass
    
    if line == "motion\n":
        print("##DEBUG: motion")
        mycursor.callproc('PutInfoAndTime') # aikaleima
        mydb.commit()

        if checkAlarm() == 1:
            takePicture()
        
        if checkAlarm() == 1 and emailEnableFlag == 1:
            print("##DEBUG: sending mail...")
            cause = "liikeanturi on aktivoitunut. "
            
            if os.system("ping -c 1 " + pingHost) == 0:
                sendMail(cause)
                print("##DEBUG: mail sent successfully")

                emailEnableFlag = 0
                print("##DEBUG: disabling email...")
                timer = threading.Timer(60.0, enableEmail)
                timer.start()
            else:
                print("##DEBUG: network is down!")
              
    if line == "magnetOn\n":
        print("##DEBUG: magnetOn")
        mycursor.callproc('update_ovi_off') # ovi menee kiinni
        mydb.commit()

    if line == "magnetOff\n":
        print("##DEBUG: magnetOff")
        mycursor.callproc('update_ovi_on') # ovi aukeaa
        mydb.commit()
        
        mycursor.callproc('put_door_info') # aikaleiman tallennus
        mydb.commit()

        if checkAlarm() == 1 and emailEnableFlag == 1:
            print("##DEBUG: sending mail...")
            cause = "ovi on avautunut. "
            
            if os.system("ping -c 1 " + pingHost) == 0:
                sendMail(cause)
                print("##DEBUG: mail sent successfully")
                
                emailEnableFlag = 0
                print("##DEBUG: disabling email...")
                timer = threading.Timer(60.0, enableEmail)
                timer.start()
            else:
                print("##DEBUG: network is down!")
