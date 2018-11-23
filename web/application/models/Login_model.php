<?php
class Login_model extends CI_model
{
  public function get_account_password($form_account)
  {
    $this->db->select('psw');
    $this->db->from('loggingInfo');
    $this->db->where('username',$form_account);

    return $this->db->get()->row('psw');
  }

  public function get_account_email($form_email){

    $this->db->select('Email');
    $this->db->from('loggingInfo');
    $this->db->where('username',$form_email);
    return $this->db->get()->row('Email');
  }

  public function updatePassword($data){

    $this->db->where('ID', 1);
    $this->db->update('loggingInfo', $data);
  }

  public function updateEmail($data){

    $this->db->where('ID', 1);
    $this->db->update('loggingInfo', $data);
  }

  public function updateUsername($data){

    $this->db->where('ID', 1);
    $this->db->update('loggingInfo', $data);
  }
}
