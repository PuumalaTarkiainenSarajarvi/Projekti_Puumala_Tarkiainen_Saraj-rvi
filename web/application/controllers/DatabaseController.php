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
    }

?>