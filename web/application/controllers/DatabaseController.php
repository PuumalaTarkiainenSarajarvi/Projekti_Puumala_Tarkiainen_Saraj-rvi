<?php

    class DatabaseController extends CI_Controller
    {
       public function __construct()
       {
           parent::__construct();
           $this->load->model('DatabaseModel');
           $this->load->helper('url');
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

            redirect('settings','refresh');
        }

        public function startAutoAlerts()
        {
            $this->DatabaseModel->startAutoAlert();
            redirect('settings','refresh');
        }

        public function stopAutoAlerts()
        {
            $this->DatabaseModel->stopAutoAlert();
            redirect('settings','refresh');
        }

        public function startManualAlerts()
        {
            $this->DatabaseModel->startManualAlert();  
            redirect('settings','refresh'); 
        }

        public function stopManualAlerts()
        {
            $this->DatabaseModel->stopManualAlert();   
            redirect('settings','refresh');
        }

    }

?>