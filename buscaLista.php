<?php

$x['lista'] = "";

include 'conexao.php';

$sql = "select * from lista";

$rs = $conexao->query($sql);

while($i = $rs->fetch_object()) {
    $x['lista'] .= $i->quantidade . " ";
    $x['lista'] .= $i->tipo . " ";
    $x['lista'] .= $i->item . "<br>";
}

echo json_encode($x);
