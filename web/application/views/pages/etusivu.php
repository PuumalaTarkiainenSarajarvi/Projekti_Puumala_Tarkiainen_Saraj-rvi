<div class="firstRow">
    <h2>Hei, <?php echo $_SESSION['user']?>!</h2>
    <h3>Hälytykset ovat tällä hetkellä <?php if($verifyOn && !$autoOnOff) echo "automaattitilassa"?> 
    <?php if($manualOn) echo "manuaaliitilassa"?>
    <?php if($manualOn == false && $verifyOn == false) echo "pois käytöstä"?>
    <?php if($autoOnOff == true) echo "kytkettynä päälle automaattisesti"?></h3>
    <h3>Automaattinen hälytys on asetettu välille 
    <?php if(isset($row)) {echo substr($row['dt'],0,-3);?> - <?php echo substr($row['dt2'],0,-3);}?></h3>
    <h3>Viimeisin hälytys tapahtunut <?php echo $recentEvent ?></h3>
    <h3>Tilan ovi on <?php if($doorState == true){ echo "auki."; } else{ echo "kiinni"; } ?></h3>
    <form action=" <?php echo site_url('databaseController/stopAlarm')?> " method="post">
                
    <?php if($alarmTriggered == true){?> <h3 style="margin-top: 2vh;">Tilassa havaittu epämääräistä liikettä!</h3><input class="alarmButton" type="submit" value="Sammuta hälytystila"><?php ;} ?>
    </form>
</div>
<h3 class="temp">Lämpötila: <?php echo round($temp, 1, PHP_ROUND_HALF_UP); ?>°C</h3>



<script type="text/javascript">

function autoUpdate()
{
    $('.firstRow').load("<?php echo base_url().'index.php/ajax/indexdata' ?>");
}

$(document).ready(function()
{
    interval = setInterval("autoUpdate()",1000);
});
</script>
</div>
