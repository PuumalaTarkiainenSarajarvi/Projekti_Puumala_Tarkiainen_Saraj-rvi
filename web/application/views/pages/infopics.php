<div class="images">
  <h3>Valvontakameran kuvat:</h3>
    <?php
     $limit = 0;
     foreach (array_reverse($pics) as $pic)
                {
                    if($limit == 10) break;
    ?>
        <img id="img" src=<?php echo "/Projekti_Puumala_Tarkiainen_Saraj-rvi/web/$pic"?>>
        <em><?php echo $pic ?></em>
                <?php } ?>
</div>
