<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="<?php echo base_url()?>css/stylesheet.css">
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Valvontajärjestelmä</title>
</head>
<body>
<div class="container">
<nav class="sidePanel">
    <h1>Valvontajärjestelmä</h1>
    <script type="text/javascript">
        var myVar;
        function showTime()
        {
            var date = new Date();
            var time = date.toLocaleTimeString();
            $(".time").html(time);
        }

        $(document).ready(function()
        {
            interval = setInterval("showTime()",1000);
        })
    </script>
    <h3 class="time"></h3>
        <?php
        if(isset($_SESSION['user_log_in']) && $_SESSION['user_log_in']==true)
        { 
            ?>
            <p class="userText">Hei, <?php echo $_SESSION['user'];?>!</p>
          <ul>
              <a href="<?php echo site_url('etusivu') ?>"><li>Etusivu</li></a>
              <a href="<?php echo site_url('infomotion') ?>"><li>Seuranta</li></a>
              <a href="<?php echo site_url('alertsettings') ?>"><li>Asetukset</li></a>
              <a href="<?php echo site_url('logout') ?>"><li>Kirjaudu ulos</li></a>
          </ul>
          <?php
        }
        else
        { ?>
            <ul><a href="<?php echo site_url('login/user_login') ?>"><li>Kirjaudu</li></a></ul>
            <?php
        }
    ?>
</nav>
