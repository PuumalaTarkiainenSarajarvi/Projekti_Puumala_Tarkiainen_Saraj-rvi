<div class="sensorContainer">
  <h2>Liikeanturin aktivoinnit:</h2>
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
