<?php

    class DatabaseController extends CI_Controller
    {
       public function __construct()
       {
           parent::__construct();
           $this->load->model('DatabaseModel');
       }

        public function printTable()
        {
            $this->DatabaseModel->getData();
        }

        public function postTimes()
        {
            $startTime = $_POST['startTime'];
            $endTime = $_POST['endTime'];

            echo $startTime;
            echo $endTime;
        }

    }

?>