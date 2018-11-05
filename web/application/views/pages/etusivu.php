<div class="container">
<nav class="sidePanel">
    <h1>Valvontajärjestelmä</h1>
    <ul>
        <li>Etusivu</li>
        <li>Info</li>
        <li>Asetukset</li>
    </ul>
</nav>
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
