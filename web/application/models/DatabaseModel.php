<?php

class DatabaseModel extends CI_Model {

    public function __construct()
    {
        $this->load->database();
    }

    public function getData()
    {
        $query = $this->db->query("CALL GetPersonIDTable()");
        return $query->result_array();
    }

    public function updateTimes($startTime, $endTime)
    {
        $data = array(
                'dt' => $startTime,
                'dt2' => $endTime

        );

        $this->db->where('id', );
        $this->db->update('halytys', $data);
    }

}

?>