<div class="images">
  <h2>Valvontakameran kuvat:</h2>
    <?php
     $limit = 0;
     foreach (array_reverse($pics) as $pic)
                {
                    if($limit == 10) break;
    ?>
        <img id="img" src=<?php echo "/Projekti_Puumala_Tarkiainen_Saraj-rvi/web/$pic"?>>
        <div class="picNameContainer"><em class="picName"><?php echo $pic ?></em></div>
                <?php } ?>
</div>
