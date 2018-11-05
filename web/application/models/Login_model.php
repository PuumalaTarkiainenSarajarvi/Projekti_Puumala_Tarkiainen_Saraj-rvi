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
}
