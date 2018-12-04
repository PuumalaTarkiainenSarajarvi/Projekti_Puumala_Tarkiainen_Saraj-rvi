<h1>Hälytysasetukset</h1>

    <h3>Aseta aikaväli jolloin hälytykset ovat käytössä</h3>
    <?php 
    if($verifyOn == false)
    {?>
    <form action="<?php echo site_url('databaseController/posttimes')?>" method="post">
        Hälytyksen aikaväli <input class="timeInput" type="time" name="startTime" required> - <input type="time" name="endTime" required><br>
        <input class="button" type="submit" value="Aseta">
    </form>
    <?php }
    
    else
    {?>
    <p>Hälytyksen aikaväliä ei voida vaihtaa automaattisten hälytysten ollessa käynnissä</p>
    <form class="disabled" action="<?php echo site_url('databaseController/posttimes')?>" method="post">
        Hälytyksen aikaväli <input class="timeInput" type="time" name="startTime" required> - <input type="time" name="endTime" required><br>
        <input disabled class="button" type="submit" value="Aseta">
    </form>
    <?php } ?>
    </div>
    

    
    <?php if($autoAlertOn == true)
    {?>
    <div class="thirdRow">
        <h3>Manuaalisen hälytyksen käynnistys</h3>
        <p>Automaattisten hälytysten ollessa hälytystilassa manuaaliset hälytykset ovat poissa käytöstä</p>
            <form style="pointer-events: none;" action=" <?php echo site_url('databaseController/startmanualalerts')?> " method="post">
                <input style="background-color:none;" disabled class="startButtonDisabled" type="submit" value="Käynnistä hälytykset">
            </form>
        </div>
        <?php }
        
        else 
        { 
    
            if($manualAlertsOn == true)
            {?>
            <div class="thirdRow">
            <h3>Manuaalisen hälytyksen pysäytys</h3>
            <p>Nappia painamalla keskeytetään manuaaliset hälytykset</p>
                <form action=" <?php echo site_url('databaseController/stopmanualalerts')?> " method="post">
                    <input class="stopButton" type="submit" value="Pysäytä hälytykset">
                </form>
            </div>
            <?php }
            
            else
            {?>
            <div class="thirdRow">
            <h3>Manuaalisen hälytyksen käynnistys</h3>
            <p>Nappia painamalla käynnistetään manuaaliset hälytykset</p>
                <form action=" <?php echo site_url('databaseController/startmanualalerts')?> " method="post">
                    <input class="startButton" type="submit" value="Käynnistä hälytykset">
                </form>
            </div>
    <?php 
        } }?>    
    

    <?php if($verifyOn == true)
    {?>
    <div class="fourthRow">
        <h3>Automaattisen hälytyksen pysäytys</h3>
        <p>Nappia painamalla keskeytetään automaattiset hälytykset</p>
            <form action=" <?php echo site_url('databaseController/stopautoalerts') ?> " method="post">
                <input class="stopButton" type="submit" value="Pysäytä hälytykset">
            </form>
    </div>
    <?php } 
    else
    {?>
    <div class="fourthRow">
    <h3>Automaattisen hälytyksen käynnistys</h3>
    <p>Nappia painamalla käynnistetään automaattiset hälytykset.
    <br></p> <strong style="b"> HUOM! Manuaaliset hälytykset poistetaan käytöstä kun automaattinen hälytys kytkeytyy päälle</strong>
        <form action=" <?php echo site_url('databaseController/startautoalerts')?> " method="post">
            <input class="startButton" type="submit" value="Käynnistä hälytykset">
        </form>
    </div>

    <?php } ?>
    
</div>