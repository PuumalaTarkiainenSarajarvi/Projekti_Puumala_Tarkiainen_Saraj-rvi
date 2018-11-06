<h3>Hälytys asetukset</h3>
<p>Aseta aikaväli jolloin hälytykset ovat käytössä</p>
<form action="<?php echo site_url('databasecontroller/posttimes')?>" method="post">
    Hälytyksen aloitus aika:<input type="time" name="startTime"><br>
    Hälytykse lopetus aika:<input type="time" name="endTime"><br>
    <input type="submit">
</form>