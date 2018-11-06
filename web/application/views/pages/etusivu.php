
<div class="content">
    <table>
        <tr>
            <th>TapahtumaID</th>
            <th>Tapahtuma aika</th>
        </tr>

    <?php foreach (array_reverse($message) as $row)
                {?>
        <tr>
            <td><?php echo $row['PersonID'];?></td>
            <td><?php echo $row['dt']; }?></td>
        </tr>

    </table>
</div>
</div>
