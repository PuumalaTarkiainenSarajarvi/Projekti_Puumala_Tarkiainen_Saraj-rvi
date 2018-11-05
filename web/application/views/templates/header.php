<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="<?php echo base_url()?>css/stylesheet.css">
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Valvontajärjestelmä</title>
</head>
<body>
<div class="container">
<nav class="sidePanel">
    <h1>Valvontajärjestelmä</h1>
    <?php
        if(isset($_SESSION['user_log_in']) && $_SESSION['user_log_in']==true)
        { ?>
          <ul>
              <li>Etusivu</li>
              <li>Info</li>
              <a href="<?php echo site_url('settings') ?>"><li>Asetukset</li></a>
              <a href="<?php echo site_url('login/logout') ?>"><li>Kirjaudu ulos</li></a>
          </ul>
          <?php
        }
    ?>
</nav>
