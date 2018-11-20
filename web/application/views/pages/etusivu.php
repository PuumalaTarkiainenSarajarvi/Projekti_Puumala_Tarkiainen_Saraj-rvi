<div class="firstRow">
    <h2>Hei, <?php echo $_SESSION['user']?>!</h2>
    <h3>Hälytykset ovat tällä hetkellä <?php if($verifyOn && !$manualOn) echo "automaattitilassa"?> 
    <?php if($manualOn) echo "manuaaliitilassa"?>
    <?php if($manualOn == false && $verifyOn == false) echo "pois käytöstä"?></h3>
    <h3>Automaattinen hälytys on asetettu välille 
    <?php if(isset($row)) {echo substr($row['dt'],0,-3);?> - <?php echo substr($row['dt2'],0,-3);}?></h3>
    <h3>Viimeisin hälytys tapahtunut <?php echo $recentEvent ?></h3>
</div>
<script type="text/javascript">

function autoUpdate()
{
    $('.firstRow').load("<?php echo base_url().'/index.php/ajaxcontroller/indexdata' ?>");
}

$(document).ready(function()
{
    interval = setInterval("autoUpdate()",1000);
});
</script>
</div>
