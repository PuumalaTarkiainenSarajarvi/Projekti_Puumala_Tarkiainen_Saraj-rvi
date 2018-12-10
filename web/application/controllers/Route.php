<?php

class Route extends CI_Controller{

    public function __construct()
    {
         parent::__construct();
         $this->load->helper('url');
         $this->load->model('DatabaseModel');
    }

    public function check_permission()
    {
      if(isset($_SESSION['user_log_in']) && $_SESSION['user_log_in'] == true)
      {
        //ei tehdä mitään
      }
      else
      {
        redirect('login/user_login');
      }
    }

    //Route etusivulle
    public function index()
    {

         $this->check_permission();
         $page = 'pages/etusivu';
         $data['alarmTriggered'] = $this->DatabaseModel->checkAlarmTriggered();
         $data['autoOnOff'] = $this->DatabaseModel->checkAutoOnOff();
         $data['doorState'] = $this->DatabaseModel->checkDoorState();
         $data['temp'] = $this->DatabaseModel->getCurTempData();
         $data['row'] = $this->DatabaseModel->getAlertTimes();
         $data['verifyOn'] = $this->DatabaseModel->checkAutoAlert();
         $data['manualOn'] = $this->DatabaseModel->checkManualAlert();
         $data['recentEvent'] = $this->DatabaseModel->getRecentEvent();

         $this->load->view('templates/header');

         $this->load->view($page, $data);
         $this->load->view('templates/footer');
    }
    //Route Asetussivun navigaatiolle
    public function settings()
    {
         $this->check_permission();
         $page = 'pages/settings';

         $data['verifyOn'] = $this->DatabaseModel->checkAutoAlert();
         $data['manualAlertsOn'] = $this->DatabaseModel->checkManualAlert();

         $this->load->view('templates/header');
         $this->load->view($page, $data);
         $this->load->view('templates/footer');
    }

    //Route hälytysasetussivulle
    public function alertSettings()
    {
         $this->check_permission();
         $page = 'pages/alertsettings';
         $nav = 'pages/settings';
         $data['verifyOn'] = $this->DatabaseModel->checkAutoAlert();
         $data['manualAlertsOn'] = $this->DatabaseModel->checkManualAlert();
         $data['autoAlertOn'] = $this->DatabaseModel->checkAutoOnOff();

         $this->load->view('templates/header');
         $this->load->view($nav);
         $this->load->view($page, $data);
         $this->load->view('templates/footer');
    }
    //Route kirjautumisasetussivulle
    public function loginSettings()
    {
         $this->check_permission();
         $page = 'pages/loginsettings';
         $nav = 'pages/settings';
         $data['verifyOn'] = $this->DatabaseModel->checkAutoAlert();
         $data['manualAlertsOn'] = $this->DatabaseModel->checkManualAlert();

         $this->load->view('templates/header');
         $this->load->view($nav);
         $this->load->view($page, $data);
         $this->load->view('templates/footer');
    }
    //Route seurantasivun navigaatiolle
    public function info()
    {
        $this->check_permission();
        $page = 'pages/info';
        $this->load->view('templates/header');

        $data['message'] = $this->DatabaseModel->getData();

        $this->load->view($page, $data);
        $this->load->view('templates/footer');
    }
    //Route liiketunnistimen seuranta sivulle
    public function infoMotion()
    {
        $this->check_permission();
        $info = 'pages/info';
        $content = 'pages/infomotion';
        $this->load->view('templates/header');

        $data['message'] = $this->DatabaseModel->getData();

        $this->load->view($info);
        $this->load->view($content, $data);
        $this->load->view('templates/footer');
    }
    //Route oven seuranta sivulle
    public function infoDoors()
    {
        $this->check_permission();
        $info = 'pages/info';
        $content = 'pages/infodoors';
        $this->load->view('templates/header');
        
        $data['sensortable'] = $this->DatabaseModel->getDoorData();

        $this->load->view($info);
        $this->load->view($content, $data);
        $this->load->view('templates/footer');
    }
    //Route lämpötilan seuranta sivulle
    public function infoTemps()
    {
        $this->check_permission();
        $data['temp'] = $this->DatabaseModel->getAvgTempData();
        $info = 'pages/info';
        $content = 'pages/infotemps';
        $this->load->view('templates/header');

        $this->load->view($info);
        $this->load->view($content, $data);
        $this->load->view('templates/footer');
    }
    //Route kuvien seuranta sivulle
    public function infoPics()
    {
        $this->check_permission();
        $info = 'pages/info';
        $content = 'pages/infopics';
        $data['pics'] = glob("img/*.jpg");

        $this->load->view('templates/header');

        $this->load->view($info);
        $this->load->view($content, $data);
        $this->load->view('templates/footer');
    }
}
