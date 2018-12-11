<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="<?php echo base_url()?>css/stylesheet.css">
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Valvontajärjestelmä</title>
</head>
<body>
<div class="container">
<nav class="sidePanel">
    <h1 class="main-header">Valvontajärjestelmä</h1>
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
              <a href="<?php echo site_url('etusivu') ?>"><li id="navItem"><i class="fa fa-home"></i> Etusivu</li></a>
              <a href="<?php echo site_url('infomotion') ?>"><li id="navItem"><i class="fa fa-binoculars"></i> Seuranta</li></a>
              <a href="<?php echo site_url('alertsettings') ?>"><li id="navItem"><i class="fa fa-cog"></i> Asetukset</li></a>
              <a href="<?php echo site_url('logout') ?>"><li id="navItem"><i class="fa fa-sign-out"></i> Kirjaudu ulos</li></a>
          </ul>
          <?php
        }
        else
        { ?>
            <ul><a href="<?php echo site_url('login/user_login') ?>"><li><i class="fa fa-sign-in"></i> Kirjaudu</li></a></ul>
            <?php
        }
    ?>
</nav>
