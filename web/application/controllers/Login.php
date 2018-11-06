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
    $page = 'pages/login';
    $this->load->view('templates/header');
    $this->load->view($page);
    $this->load->view('templates/footer');
  }

  public function user_log_in()
  {
    $form_account=$this->input->post('Käyttäjätunnus');
    $form_password=$this->input->post('Salasana');
    $database_password=$this->Login_model->get_account_password($form_account);
    /*if(password_verify($form_password,$database_password))
    {
      $_SESSION['user_log_in']=true;
      $_SESSION['user']=$form_account;
    }*/
    if($form_password == $database_password && isset($form_account))
    {
      $_SESSION['user_log_in']=true;
      $_SESSION['user']=$form_account;

      $page = 'pages/etusivu';
      $this->load->view('templates/header');
      $data['message'] = $this->DatabaseModel->getData();
      $this->load->view($page, $data);
      $this->load->view('templates/footer');
    }
    else
    {
      $_SESSION['user_log_in']=false;
      $data['message']='Käyttäjätunnus tai salasana ei täsmää';
      $this->load->view('pages/message',$data);
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
