<div class="sensorTable">
    <table>
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