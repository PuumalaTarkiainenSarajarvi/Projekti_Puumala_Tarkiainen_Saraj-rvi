<div class="settingsContent">
<h3 class="firstRow">Hälytysasetukset</h3>
<p class="secondRow">Aseta aikaväli jolloin hälytykset ovat käytössä</p>
<form action="<?php echo site_url('databasecontroller/posttimes')?>" method="post">
    Hälytyksen aikaväli <input type="time" name="startTime"> - <input type="time" name="endTime"><br>
    <input class="button" type="submit" value="Aseta">
</form>

<div class="thirdRow">
    <form action="" method="post">
        <input class="stopButton" type="button" value="Pysäytä hälytykset">
    </form>
</div>

</div>
</div>
