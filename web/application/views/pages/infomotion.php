<div class="sensorContainer">
  <h3>Liikeanturin aktivoinnit:</h3>
    <table class="sensorTable">
        <tr>
            <th>Tapahtuma aika</th>
        </tr>

    <?php
     $limit = 0;
     foreach (array_reverse($message) as $row)
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
</div>
