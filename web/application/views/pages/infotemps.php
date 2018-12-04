<div class="sensorContainer">
    <table class="sensorTableTemps">
        <tr>
            <th>Lämpötila</th>
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
                <?php echo substr($row['temperature24h'],0,4);
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