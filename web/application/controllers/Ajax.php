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
        if($verifyOn && !$autoOnOff) ?> automaattitilassa <?php ; 
        if($manualOn) ?> manuaalitilassa<?php ;
        if($manualOn == false && $verifyOn == false) ?> pois käytöstä <?php ;
        if($autoOnOff == true){ ?> kytkettynä päälle automaattisesti</h3> <?php ;} ?> 
        <h3>Automaattinen hälytys on asetettu välille <?php ;
        if(isset($row)) {echo substr($row['dt'],0,-3); echo ' - '; echo substr($row['dt2'],0,-3);}?> 
        </h3>
        <h3>Viimeisin hälytys tapahtunut <?php; echo $recentEvent; ?> </h3> <?php ;
        
        ?> <h3>Tilan ovi on <?php if($doorState == true){ echo "auki."; } else{ echo "kiinni."; } ?> </h3> <?php ;
        ?> <form action="<?php echo site_url('databaseController/stopAlarm')?>" method="post"><?php ;
        if($alarmTriggered == true){ 
            ?> <h3>Tilassa havaittu epämääräistä liikettä!</h3>
            <input class="alarmButton" type="submit" value="Sammuta hälytystila">
        <?php ;}?>
        </form> </div>
    }
}