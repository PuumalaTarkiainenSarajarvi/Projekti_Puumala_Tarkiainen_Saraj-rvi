<?php

class AjaxController extends CI_Controller{

    public function __construct()
    {
         parent::__construct();
         $this->load->helper('url');
         $this->load->model('DatabaseModel');
    }

    public function indexData()
    {
        $row = $this->DatabaseModel->getAlertTimes();
        $verifyOn = $this->DatabaseModel->checkAutoAlert();
        $manualOn = $this->DatabaseModel->checkManualAlert();
        $recentEvent = $this->DatabaseModel->getRecentEvent();
        echo "<div class='firstRow'>
        <h2>Hei, "; echo $_SESSION['user']; echo "!</h2>
        <h3>Hälytykset ovat tällä hetkellä "; 
        if($verifyOn && !$manualOn) echo "automaattitilassa"; 
        if($manualOn) echo "manuaaliitilassa";
        if($manualOn == false && $verifyOn == false) echo "pois käytöstä</h3>";
        echo "<h3>Automaattinen hälytys on asetettu välille ";
        if(isset($row)) {echo substr($row['dt'],0,-3); echo ' - '; echo substr($row['dt2'],0,-3);}
        echo "</h3>
        <h3>Viimeisin hälytys tapahtunut "; echo $recentEvent; echo"</h3>
    </div>";
        
    }
}