<?php

class DatabaseModel extends CI_Model {

    public function __construct()
    {
        $this->load->database();
    }

    public function getData()
    {
        $query = $this->db->query("CALL GetPersonIDTable()");
        return $query->result();
    }

}

?>