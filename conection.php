<?php
    function abreCon() {
        $con = mysqli_connect('localhost','root','','herpetarium');
        if (!$con) echo mysqli_error($con);

        return $con;
    }
   

    function buscaCobra($con, $cod){

		$sql = "SELECT * FROM cobras WHERE codigo=$cod";
		$resultado = mysqli_query($con, $sql);

		return mysqli_fetch_array($resultado) ?: false;
    }

    function insereCobra($con) {
        $cor = 1;
        $fome = 100;
        $sujeira = 100;
        $sql = "INSERT INTO cobras (cor,fome,sujeira) VALUES ('$cor','$fome','$sujeira')";

        $sucesso = mysqli_query($con, $sql);

         if (mysqli_query($con, $sql)) {
        echo "Cobra cadastrada com sucesso!";
        } else {
            echo "Erro ao cadastrar cobra!" . mysqli_error($con);
        }
    }

    function buscaCard($con, $cod){

		$sql = "SELECT * FROM cards WHERE cod_card=$cod";
		$resultado = mysqli_query($con, $sql);

		return mysqli_fetch_array($resultado) ?: false;
    }
    
?>