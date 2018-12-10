<?php

    class Databasecontroller extends CI_Controller
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

        public function printDoorTable()
        {
            $this->DatabaseModel->getDoorData();
        }

        //Päivitetään hälytyksen aikaväli
        public function postTimes()
        {
            $startTime = $_POST['startTime'];
            $endTime = $_POST['endTime'];

            $this->DatabaseModel->updateTimes($startTime, $endTime);
            
            redirect('alertsettings','refresh');
        }
        
        public function startAutoAlerts()
        {
            $this->DatabaseModel->startAutoAlert();
            redirect('alertsettings','refresh');
        }

        public function stopAlarm()
        {
            $this->DatabaseModel->stopAlarm();
            redirect('etusivu','refresh');
        }

        public function stopAutoAlerts()
        {
            $this->DatabaseModel->stopAutoAlert();
            redirect('alertsettings','refresh');
        }

        public function startManualAlerts()
        {
            $this->DatabaseModel->startManualAlert();  
            redirect('alertsettings','refresh'); 
        }

        public function stopManualAlerts()
        {
            $this->DatabaseModel->stopManualAlert();   
            redirect('alertsettings','refresh');
        }

    }

?>