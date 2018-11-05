<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends CI_Controller
{
  function __construct()
  {
    parent::__construct();
    $this->load->helper('url');
    $this->load->model('Login_model');
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
    //print_r($this->input->post());
    $form_account=$this->input->post('Käyttäjätunnus');
    $form_password=$this->input->post('Salasana');
    $database_password=$this->Login_model->get_account_password($form_account);
    if(password_verify($form_password,$database_password))
    {
      $_SESSION['user_log_in']=true;
      $_SESSION['user']=$form_account;
      
    }
    else
    {
        $_SESSION['user_log_in']=false;
        $data['message']='Käyttäjätunnus tai salasana ei täsmää';
        $data['page']='pages/message';
        $this->load->view('menu/page_content',$data);
    }
  }
  public function logout()
  {
    $_SESSION['user_log_in']=false;
    session_destroy();
    $data['message']='Olet kirjautunut ulos.';
    $data['page']='pages/message';
    $this->load->view('menu/page_content',$data);
  }
}
