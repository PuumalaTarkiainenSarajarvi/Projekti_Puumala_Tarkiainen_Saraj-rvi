<div class="images">
  <h2>Valvontakameran kuvat:</h2>
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
