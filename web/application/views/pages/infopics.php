<div class="images">
    <?php
     $limit = 0;
     foreach (array_reverse($pics) as $pic)
                {
                    if($limit == 10) break;
    ?>
        <img id="img" src=<?php echo $pic ?>>
                <?php } ?>
</div>