<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends CI_Controller
{
  function __construct()
  {
    parent::__construct();
    $this->load->helper('url');
    $this->load->model('Login_model');
    $this->load->model('DatabaseModel');
  }

  public function user_login()
  {
    if(isset($_SESSION['user_log_in']))
    {
      redirect('etusivu');
    }
    else
    {
      $page = 'pages/login';
      $this->load->view('templates/header');
      $this->load->view($page);
      $this->load->view('templates/footer');
    }
  }

  public function user_log_in()
  {
    $form_account=$this->input->post('Käyttäjätunnus');
    $form_password=$this->input->post('Salasana');
    $database_password=$this->Login_model->get_account_password($form_account);

    if(password_verify($form_password,$database_password) && isset($form_account))
    {
      $_SESSION['user_log_in']=true;
      $_SESSION['user']=$form_account;

      $page = 'pages/etusivu';
      $this->load->view('templates/header');
      $data['alarmTriggered'] = $this->DatabaseModel->checkAlarmTriggered();
      $data['autoOnOff'] = $this->DatabaseModel->checkAutoOnOff();
      $data['doorState'] = $this->DatabaseModel->checkDoorState();
      $data['temp'] = $this->DatabaseModel->getCurTempData();
      $data['row'] = $this->DatabaseModel->getAlertTimes();
      $data['verifyOn'] = $this->DatabaseModel->checkAutoAlert();
      $data['manualOn'] = $this->DatabaseModel->checkManualAlert();
      $data['recentEvent'] = $this->DatabaseModel->getRecentEvent();
      $data['message'] = $this->DatabaseModel->getData();
      $this->load->view($page, $data);
      $this->load->view('templates/footer');
    }
    else
    {
      $_SESSION['user_log_in']=false;
      $data['message']='Käyttäjätunnus tai salasana ei täsmää,
                        ole hyvä ja tarkista tiedot.';
      $this->load->view('templates/header');
      $this->load->view('pages/message',$data);
      $this->load->view('templates/footer');
    }
  }
  public function logout()
  {
    $_SESSION['user_log_in']=false;
    unset($_SESSION['user_log_in'], $_SESSION['user']);
    session_destroy();

    $page = 'pages/login';
    $this->load->view('templates/header');
    $this->load->view($page);
    $this->load->view('templates/footer');
  }
}
