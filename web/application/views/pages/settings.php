<div class="content">
<h3 class="firstRow">Hälytysasetukset</h3>
<p class="secondRow">Aseta aikaväli jolloin hälytykset ovat käytössä</p>
<form action="<?php echo site_url('databasecontroller/posttimes')?>" method="post">
    Hälytyksen aikaväli <input type="time" name="startTime"> - <input type="time" name="endTime"><br>
    <input class="button" type="submit">
</form>

<div class="rightSide"> </div>

</div>
</div>
