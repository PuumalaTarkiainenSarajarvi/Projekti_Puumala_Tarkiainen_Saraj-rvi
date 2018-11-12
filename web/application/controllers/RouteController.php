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

         $data['message'] = $this->DatabaseModel->getData();

         $this->load->view($page, $data);
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
}
