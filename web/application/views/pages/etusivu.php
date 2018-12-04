<div class="firstRow">
    <h2>Hei, <?php echo $_SESSION['user']?>!</h2>
    <h3>Hälytykset ovat tällä hetkellä <?php if($verifyOn && !$manualOn) echo "automaattitilassa"?> 
    <?php if($manualOn) echo "manuaaliitilassa"?>
    <?php if($manualOn == false && $verifyOn == false) echo "pois käytöstä"?></h3>
    <h3>Automaattinen hälytys on asetettu välille 
    <?php if(isset($row)) {echo substr($row['dt'],0,-3);?> - <?php echo substr($row['dt2'],0,-3);}?></h3>
    <h3>Viimeisin hälytys tapahtunut <?php echo $recentEvent ?></h3>
    <h3>Tilan ovi on <?php if($doorState){ echo "auki."; } else{ echo "kiinni"; } ?></h3>
    
</div>
<h3 class="temp">Lämpötila: <?php echo $temp ?>°C</h3>

<script type="text/javascript">

function autoUpdate()
{
    $('.firstRow').load("<?php echo base_url().'/index.php/ajax/indexdata' ?>");
}

$(document).ready(function()
{
    interval = setInterval("autoUpdate()",1000);
});
</script>
</div>
