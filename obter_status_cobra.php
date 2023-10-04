<?php
require_once('conection.php');

function obterStatusCobra($con, $codigoCobra) {
    $sql = "SELECT fome, sujeira FROM cobras WHERE codigo=$codigoCobra";
    $resultado = mysqli_query($con, $sql);

    if ($registro = mysqli_fetch_assoc($resultado)) {
        return $registro;
    } else {
        return null;
    }
}

if (isset($_GET['codigo_cobra'])) {
    $codigoCobra = $_GET['codigo_cobra'];
    $statusCobra = obterStatusCobra($con, $codigoCobra);
    echo json_encode($statusCobra);
} else {
    echo json_encode(null);
}
?>
