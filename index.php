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

session_start();
?>

<!DOCTYPE html>
<html>
<head>
  <title>Herpetárium</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <link rel="stylesheet" href="style.css">
  <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
</head>
<body>
<audio id="background-audio" loop autoplay>
  <source src="nocopyright.mp3" type="audio/mpeg">
</audio>
  <div class="phone-wrapper">
    <div class="bg-wrapper">
      <div class="content-wrapper">
        <div id="enclosure" class="enclosure"></div>
        <div id="dirt" class="sujeira"></div>
        <div class="snake-wrapper">
          <button id="optionsButton" class="options-button">&#8942;</button>
          <img id="snake" height="60" width="130" class="snake">
          <div id="hunger" class="fome">
            <div class="bar">
              <div class="hit"></div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Modal de Opções -->
  
  <div id="optionsModal" class="modal">
    <div class="modal-content">
      <div class="modal-header">
        <span id="closeOptionsModal" class="close">&times;</span>
      </div>
      <div class="modal-body">
        <div class="container">
          <button id="saveGameButton" class="save-game-button">Salvar</button>
        </div>
      </div>
    </div>
  </div>

  <!-- Modal de Comida e Sujeira -->
  <div id="foodAndDirtModal" class="modal">
    <div class="modal-content">
      <div class="modal-header">
        <span id="closeFoodAndDirtModal" class="close">&times;</span>
      </div>
      <div class="modal-body">
        <div class="container">
          <button class="reset-comida icon-food-button"></button>
          <div id="comida" class="health-bar">
            <div class="bar">
              <div class="hit"></div>
            </div>
          </div>
        </div>
        <br>
        <div class="container">
          <button class="reset-sujeira icon-cleaning-button"></button>
          <div id="sujeira" class="health-bar">
            <div class="bar">
              <div class="hit"></div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Card -->
  <div id="cardPopup" class="modal">
    <div class="modal-content">
      <div class="modal-header">
        <span id="closeCardModal" class="close">&times;</span>
      </div>
      <div class="modal-body">
        <div class="container">
          <h2 id="titulo"></h2>
          <span id="info"></span>
        </div>
      </div>
    </div>
  </div>

    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <script src="script.js"></script>
  </body>
</html>