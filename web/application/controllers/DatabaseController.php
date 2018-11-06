<?php

    class DatabaseController extends CI_Controller
    {
       public function __construct()
       {
           parent::__construct();
           $this->load->model('DatabaseModel');
           date_default_timezone_set('Etc/GMT+2');
       }

        public function printTable()
        {
            $this->DatabaseModel->getData();
        }

        public function postTimes()
        {
            $startTime = $_POST['startTime'];
            $endTime = $_POST['endTime'];

            $this->DatabaseModel->updateTimes($startTime, $endTime);
        }

    }

?>