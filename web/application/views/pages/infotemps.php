<div class="sensorContainer">
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
                <?php echo $row['dt'];
                      $limit++; 
                }?>
            </td>
        </tr>

    </table>
</div>
</div>