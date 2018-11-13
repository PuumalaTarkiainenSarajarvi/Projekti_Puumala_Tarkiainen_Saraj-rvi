        <div class ="firstRow">
    <h1>Hälytysasetukset</h1>
    <h3>Aseta aikaväli jolloin hälytykset ovat käytössä</h2>
    <form action="<?php echo site_url('databasecontroller/posttimes')?>" method="post">
        Hälytyksen aikaväli <input class="timeInput" type="time" name="startTime" required> - <input type="time" name="endTime" required><br>
        <input class="button" type="submit" value="Aseta">
    </form>
    </div>

    <?php 
    if($manualAlertsOn == true)
    {?>
    <div class="thirdRow">
    <h3>Manuaalisen hälytyksen pysäytys</h3>
    <p>Nappia painamalla keskeytetään manuaaliset hälytykset</p>
        <form action=" <?php echo site_url('databasecontroller/stopmanualalerts')?> " method="post">
            <input class="stopButton" type="submit" value="Pysäytä hälytykset">
        </form>
    </div>
    <?php }
    
    else
    {
        ?>
    <div class="thirdRow">
    <h3>Manuaalisen hälytyksen käynnistys</h3>
    <p>Nappia painamalla käynnistetään manuaaliset hälytykset</p>
        <form action=" <?php echo site_url('databasecontroller/startmanualalerts')?> " method="post">
            <input class="startButton" type="submit" value="Käynnistä hälytykset">
        </form>
    </div>

    <?php } ?>

    <?php if($verifyOn == true)
    {?>
    <div class="fourthRow">
        <h3>Automaattisen hälytyksen pysäytys</h3>
        <p>Nappia painamalla keskeytetään automaattiset hälytykset</p>
            <form action=" <?php echo site_url('databasecontroller/stopautoalerts') ?> " method="post">
                <input class="stopButton" type="submit" value="Pysäytä hälytykset">
            </form>
    </div>
    <?php }
        
        else 
        {
        ?>
    <div class="fourthRow">
    <h3>Automaattisen hälytyksen käynnistys</h3>
    <p>Nappia painamalla käynnistetään automaattiset hälytykset</p>
        <form action=" <?php echo site_url('databasecontroller/startautoalerts')?> " method="post">
            <input class="startButton" type="submit" value="Käynnistä hälytykset">
        </form>
    </div>

    <?php } ?>
    
</div>
