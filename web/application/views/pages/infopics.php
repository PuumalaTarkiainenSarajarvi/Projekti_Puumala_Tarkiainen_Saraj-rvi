<div class="picHead">
  <h2>Valvontakameran kuvat:</h2>
</div>
<div class="images">
<?php
     $limit = 0;
     foreach (array_reverse($pics) as $pic)
                {
    ?>
        
        <img id="img" src=<?php echo "/Projekti_Puumala_Tarkiainen_Saraj-rvi/web/$pic"?>>
        
        <form class="picDeleteForm" action="<?php echo site_url('databaseController/deletePic') ?>" method="post">
          <input class="deleteButton" type="submit" value="Poista">
          <input type="hidden" name="pic" value="<?php echo $pic ?>">
        </form>
        <div class="picNameContainer"><em class="picName"><?php echo str_replace("-"," ",substr($pic, 4, 19)); ?></em></div>
                <?php $limit++;} ?>
  </div>
