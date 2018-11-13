<?php

class RouteController extends CI_Controller{

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

    public function index()
    {
         $this->check_permission();
         $page = 'pages/etusivu';
         $this->load->view('templates/header');

         $this->load->view($page);
         $this->load->view('templates/footer');
    }

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

    public function info()
    {
        $this->check_permission();
        $page = 'pages/info';
        $this->load->view('templates/header');

        $data['message'] = $this->DatabaseModel->getData();

        $this->load->view($page, $data);
        $this->load->view('templates/footer');
    }

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

    public function infoDoors()
    {
        $this->check_permission();
        $info = 'pages/info';
        $content = 'pages/infodoors';
        $this->load->view('templates/header');

        $this->load->view($info);
        $this->load->view($content);
        $this->load->view('templates/footer');
    }

    public function infoTemps()
    {
        $this->check_permission();
        $info = 'pages/info';
        $content = 'pages/infotemps';
        $this->load->view('templates/header');

        $this->load->view($info);
        $this->load->view($content);
        $this->load->view('templates/footer');
    }

    public function infoPics()
    {
        $this->check_permission();
        $info = 'pages/info';
        $content = 'pages/infopics';
        $this->load->view('templates/header');

        $this->load->view($info);
        $this->load->view($content);
        $this->load->view('templates/footer');
    }
}
