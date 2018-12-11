<div class="sensorContainer">
  <h2>Keskiarvolämpötilat:</h2>
    <table class="sensorTableTemps">
        <tr>
            <th>Lämpötila 12h</th>
            <th>Lämpötila 24h</th>
            <th>Päivämäärä</th>
        </tr>

    <?php
     $limit = 0;
     foreach (array_reverse($temp) as $row)
                {
                    if($limit == 10) break;
    ?>
        <tr>
            <td>
                <?php echo round( $row['temperature12h'], 1, PHP_ROUND_HALF_UP);
                ?>
            </td>

            <td>
                <?php echo round( $row['temperature24h'], 1, PHP_ROUND_HALF_UP);
                ?>
            </td>
            <td>
            <?php 
                    $date = DateTime::createFromFormat('Y-m-d H:i:s', $row['dt']);
                    echo $date->format('H:i d.m.Y');
                    
                      $limit++;
                }?>
            </td>
        </tr>

    </table>
</div>
</div>
