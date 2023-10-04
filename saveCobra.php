<?php
require_once('conection.php');
    $codigoCobra = @$_REQUEST['codigoCobra'];
    $fome = @$_REQUEST['fome'];
    $limpeza = @$_REQUEST['limpeza'];
    
    $codigoCobra = mysqli_real_escape_string($con, $codigoCobra);
    $fome = mysqli_real_escape_string($con, $fome);
    $limpeza = mysqli_real_escape_string($con, $limpeza);

    $dataHoraAtual = date('Y-m-d H:i:s');

    
    $sql = "INSERT INTO save (cod_jog, cod_cob, data_save) VALUES (2, ?, ?)";
    $stmt = mysqli_prepare($con, $sql);
    echo 'sql: ' . $sql;
    
    mysqli_stmt_bind_param($stmt, "is", $codigoCobra, $dataHoraAtual);
    $sucesso = mysqli_stmt_execute($stmt);

    if ($sucesso) {
               
        $sql = "UPDATE cobras SET fome=?, sujeira=? WHERE codigo=?";
        echo 'sql: ' . $sql;
        $stmt = mysqli_prepare($con, $sql);

        mysqli_stmt_bind_param($stmt, "iii", $fome, $limpeza, $codigoCobra);
        $sucesso = mysqli_stmt_execute($stmt);
        var_dump($sucesso);
        die();
        return $sucesso;

    } else {
        echo "Erro ao salvar o jogo!";
        echo mysqli_error($con);
    }

?>