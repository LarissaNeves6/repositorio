<?php 
    require_once 'conection.php';

    $cod = @$_REQUEST['cod'];

    $con = abreCon();
    $result = buscaCard($con, $cod);

    var_dump($result);
    console.log($result);
?>