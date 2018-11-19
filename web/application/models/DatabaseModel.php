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

    public function getDoorData()
    {
        $query = $this->db->query("SELECT * from oviinfo");
        return $query->result_array();

    }

    public function updateTimes($startTime, $endTime)
    {
        $data = array(
                'dt' => $startTime,
                'dt2' => $endTime

        );

        $this->db->where('halytysID', 1);
        $this->db->update('halytys', $data);
    }

    public function stopAlert()
    {
        $this->db->query("CALL update_off");
    }

    public function checkAutoAlert()
    {
        $query = $this->db->get_where('halytys', array('halytysID'=> 1));
        
        foreach($query->result_array() as $row)
        {

            if($row['verify']== 1)
            {
                return true;
            }

            else
            {
                return false;
            }
        }

    }

    public function checkManualAlert()
    {
        $query = $this->db->get_where('halytys', array('halytysID'=> 1));
        
        foreach($query->result_array() as $row)
        {

            if($row['on_off'] == 1)
            {
                return true;
            }

            else
            {
                return false;
            }
        }

    }

    public function startAutoAlert()
    {
        $this->db->query('CALL update_verify_on');   
    }

    public function stopAutoAlert()
    {
        $this->db->query('CALL update_verify_off');   
    }

    public function startManualAlert()
    {
        $this->db->query('CALL update_on');   
    }

    public function stopManualAlert()
    {
        $this->db->query('CALL update_off');   
    }

}

?>