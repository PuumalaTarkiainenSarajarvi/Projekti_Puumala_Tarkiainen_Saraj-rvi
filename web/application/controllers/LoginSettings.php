<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class LoginSettings extends CI_Controller
{
  public function check_permission2()
  {
    if(isset($_SESSION['user_log_in']) && $_SESSION['user_log_in'] == true)
    {
    }
    else
    {
      redirect('login/user_login');
    }
  }
  function __construct()
  {
    parent::__construct();
    $this->load->helper('url');
    $this->load->model('Login_model');
    $this->load->model('DatabaseModel');
  }
  public function user_email()
  {
    $this->check_permission2();
    $page = 'pages/changeemail';
    $this->load->view('templates/header');
    $this->load->view($page);
    $this->load->view('templates/footer');
  }
  public function change_email(){
    $this->check_permission2();
    $form_account = $this->input->post('Käyttäjätunnus');
    $form_password = $this->input->post('Salasana');
    $form_email = $this->input->post('Vanha_email');
    $form_newemail = $this->input->post('Uusi_email');

    $database_password=$this->Login_model->get_account_password($form_account);
    $database_email=$this->Login_model->get_account_email($form_account);

    if(password_verify($form_password,$database_password) && isset($form_account))
    {

      $_SESSION['change_email'] = true;
      $_SESSION['user']=$form_account;


      $data = array(
              'Email' => $form_newemail
      );

      $this->Login_model->updateEmail($data);

      $this->load->view('templates/header');
      $data['message']='Sähköposti vaihdettu onnistuneesti';

      $this->load->view('pages/message',$data);
      $this->load->view('templates/footer');

  }
    else
    {
      $_SESSION['change_email'] = false;
      $data['message']='Käyttäjätunnus tai salasana tai vanha sähköposti ei täsmää yritä uudelleen';
      $this->load->view('templates/header');
      $this->load->view('pages/message',$data);
      $this->load->view('templates/footer');
    }


  }
  public function user_username()
  {
    $this->check_permission2();
    $page = 'pages/changeusername';
    $this->load->view('templates/header');
    $this->load->view($page);
    $this->load->view('templates/footer');
  }

public function change_username(){
  $this->check_permission2();
  $form_account = $this->input->post('Käyttäjätunnus');
  $form_password = $this->input->post('Salasana');
  $form_newusername = $this->input->post('Uusi_käyttäjätunnus');

  $database_password=$this->Login_model->get_account_password($form_account);

  if(password_verify($form_password,$database_password) && isset($form_account))
  {
    $_SESSION['change_username'] = true;
    $_SESSION['user']=$form_account;
    $data = array(
            'username' => $form_newusername
    );

    $this->Login_model->updateUsername($data);

$this->load->view('templates/header');
  $data['message']='Käyttäjänimi vaihdettu onnistuneesti';

    $this->load->view('pages/message',$data);
    $this->load->view('templates/footer');


  }
  else
  {
    $_SESSION['change_username'] = false;
    $data['message']='Käyttäjätunnus tai salasana ei täsmää yritä uudelleen';
    $this->load->view('templates/header');
    $this->load->view('pages/message',$data);
    $this->load->view('templates/footer');
  }
}

public function user_password()
{
  $this->check_permission2();
  $page = 'pages/changepassword';
  $this->load->view('templates/header');
  $this->load->view($page);
  $this->load->view('templates/footer');
}

public function change_password(){
$this->check_permission2();
  $form_account = $this->input->post('Käyttäjätunnus');
  $form_password = $this->input->post('Salasana');
  $form_newpsw = $this->input->post('Uusi_salasana');

  $database_password=$this->Login_model->get_account_password($form_account);

  if(password_verify($form_password,$database_password) && isset($form_account))
  {
    $_SESSION['change_password'] = true;
    $_SESSION['user']=$form_account;
    $hash = password_hash($form_newpsw, PASSWORD_DEFAULT);
    $data = array(
            'psw' => $hash
    );

    $this->Login_model->updatePassword($data);

$this->load->view('templates/header');
  $data['message']='Salasana vaihdettu onnistuneesti';

    $this->load->view('pages/message',$data);
    $this->load->view('templates/footer');


  }
  else
  {
    $_SESSION['change_password'] = false;
    $data['message']='Käyttäjätunnus tai salasana ei täsmää yritä uudelleen';
    $this->load->view('templates/header');
    $this->load->view('pages/message',$data);
    $this->load->view('templates/footer');
  }
}
}?>
