<h3>Hälytysasetukset</h3>
<p>Aseta aikaväli jolloin hälytykset ovat käytössä</p>
<form action="<?php echo site_url('databasecontroller/posttimes')?>" method="post">
    Hälytyksen aloitusaika:<input type="time" name="startTime"><br>
    Hälytyksen lopetusaika:<input type="time" name="endTime"><br>
    <input type="submit">
</form>
