<?php

class RouteController extends CI_Controller{

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
         
         $data['message'] = $this->DatabaseModel->getData();
         
         $this->load->view($page, $data);
         $this->load->view('templates/footer');
    }

    public function settings()
    {
         $page = 'pages/settings';

         $this->load->view('templates/header');
         $this->load->view($page);
         $this->load->view('templates/footer');
    }
}