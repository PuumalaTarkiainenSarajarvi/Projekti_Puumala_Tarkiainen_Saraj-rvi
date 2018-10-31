<?php

class Routes extends CI_Controller{

    public function __construct()
    {
         parent::__construct();
         $this->load->helper('url');
         $this->load->model('DatabaseModel');
    }

    public function index()
    {
         $page = 'pages/etusivu';
         $this->load->view('templates/header');
         
         $query = $this->DatabaseModel->getData();
         foreach ($query as $row)
         {
                 echo $row->PersonID;
                 echo $row->dt;
         }
         
         $this->load->view($page);
         $this->load->view('templates/footer');
    }
}