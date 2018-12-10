<?php

class Ajax extends CI_Controller{

    public function __construct()
    {
         parent::__construct();
         $this->load->helper('url');
         $this->load->model('DatabaseModel');
    }


    
    public function indexData()
    {
        $alarmTriggered = $this->DatabaseModel->checkAlarmTriggered();
        $autoOnOff = $this->DatabaseModel->checkAutoOnOff();
        $doorState = $this->DatabaseModel->checkDoorState();
        $row = $this->DatabaseModel->getAlertTimes();
        $verifyOn = $this->DatabaseModel->checkAutoAlert();
        $manualOn = $this->DatabaseModel->checkManualAlert();
        $recentEvent = $this->DatabaseModel->getRecentEvent();
        echo "<div class='firstRow'>
        <h2>Hei, "; echo $_SESSION['user']; echo "!</h2>
        <h3>Hälytykset ovat tällä hetkellä "; 
        if($verifyOn && !$autoOnOff){ echo "automaattitilassa"; echo "<h3>Automaattinen hälytys on asetettu välille ";
            if(isset($row)) {echo substr($row['dt'],0,-3); echo ' - '; echo substr($row['dt2'],0,-3);} 
            echo "</h3>"; } 
        if($manualOn == true) echo "manuaalitilassa";
        if($manualOn == false && $verifyOn == false) "pois käytöstä ";
        if($autoOnOff == true){ echo "kytkettynä päälle automaattisesti</h3>";} 
        if($manualOn == false && $verifyOn == false) echo " pois käytöstä";
        
        echo "<h3>Viimeisin hälytys tapahtunut "; echo $recentEvent; echo"</h3>
        
        <h3>Tilan ovi on "; if($doorState == true){ echo "auki."; } else{ echo "kiinni."; } echo "</h3>";
        echo '<form action="'; echo site_url('databaseController/stopAlarm'); echo'" method="post">';
        if($alarmTriggered == true){ 
            echo "<h3>Tilassa havaittu epämääräistä liikettä!</h3>";
            echo '<input class="alarmButton" type="submit" value="Sammuta hälytystila">';
        ;}
        echo "</form> </div>";
    }
}
