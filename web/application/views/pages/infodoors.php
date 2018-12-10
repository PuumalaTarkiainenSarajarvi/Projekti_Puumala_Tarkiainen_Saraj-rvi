<div class="sensorContainer">
  <h3>Oven aukaisut:</h3>
    <table class="sensorTable">
        <tr>
            <th>Tapahtuma aika</th>
        </tr>

    <?php
     $limit = 0;
     foreach (array_reverse($sensortable) as $row)
                {
                    if($limit == 10) break;
    ?>
        <tr>
            <td>
                <?php echo $row['dt'];
                      $limit++;
                }?>
            </td>
        </tr>

    </table>
</div>
