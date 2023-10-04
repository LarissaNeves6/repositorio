$(document).ready(function(){
  var resetComida = $('button.reset-comida'),
  resetSujeira = $('button.reset-sujeira'),

  hBarComida = $('#comida'),
  barComida = hBarComida.find('.bar'),
  hitComida = hBarComida.find('.hit'),

  hBarSujeira = $('#sujeira'),
  barSujeira = hBarSujeira.find('.bar'),
  hitSujeira = hBarSujeira.find('.hit');

  var valueComida = hBarComida.data('value');
  var valueSujeira = hBarSujeira.data('value');

  var damageComida = 100;
  var damageSujeira = 50;
  
  var hitWidthComida = 1;
  var hitWidthSujeira = 1;

  var interComida = Math.floor(Math.random() * 4000) + 1000;
  var interSujeira = Math.floor(Math.random() * 4000) + 1000;

  function exibirCardModal() {
    const tMin = 1000;
    const tMax = 5000;
    const cod = Math.floor(Math.random(19))+ 1;
    const tempoAleatorio = Math.floor(Math.random() * (tMax - tMin + 1)) + tMin;

    setTimeout(function(){
      $('#cardPopup').css('display', 'block');
      $.get('card.php', {cod: cod}, 
        function(resp){
          alert(resp);
        }
      );
    }, tempoAleatorio);

  }
  

// função para atualizar a barra de comida
function atualizarBarraComida() {
  valueComida = hBarComida.data('value');
  var newValueComida = valueComida - damageComida;
  hitWidthComida = hitWidthComida + (damageComida / 10);
  hitComida.css('width', hitWidthComida + '%');
  if (hitWidthComida < 20) {
    $('#hunger').attr('src', 'hunger0.png');
  } else if (hitWidthComida < 30) {
    $('#hunger').attr('src', 'hunger1.png');
  } else if (hitWidthComida < 50) {
    $('#hunger').attr('src', 'hunger2.png');
  } else {
    $('#hunger').attr('src', 'hunger3.png');
  }
  newValueComida = Math.max(newValueComida, 1); // Limita o valor mínimo em zero
  hBarComida.data('value', newValueComida);
}

function atualizarBarraSujeira() {
  valueSujeira = hBarSujeira.data('value');
  var newValueSujeira = valueSujeira - damageSujeira;
  hitWidthSujeira = hitWidthSujeira + (damageSujeira / 10);
  hitSujeira.css('width', hitWidthSujeira + '%');
  if (hitWidthSujeira < 20) {
    $('#dirt').attr('src', 'dirt0.png');
  } else if (hitWidthSujeira < 30) {
    $('#dirt').attr('src', 'dirt1.png');
  } else if (hitWidthSujeira < 50) {
    $('#dirt').attr('src', 'dirt2.png');
  } else {
    $('#dirt').attr('src', 'dirt3.png');
  }
  newValueSujeira = Math.max(newValueSujeira, 1); // Limita o valor mínimo em zero
  hBarSujeira.data('value', newValueSujeira);
}

// intervalo para atualizar as barras
setInterval(function(){atualizarBarraSujeira();}, interSujeira);
setInterval(function(){atualizarBarraComida();}, interComida);
//exibirCardModal();

// evento para resetar a barra de comida
resetComida.on('click', function(e){
hBarComida.data('value', 100);
hitWidthComida = 0;
hitComida.css({'width': '0'});
barComida.css('width', '100%');
});

// evento para resetar a barra de sujeira
resetSujeira.on('click', function(e){
hBarSujeira.data('value', 100);
hitWidthSujeira = 0;
hitSujeira.css({'width': '0'});
barSujeira.css('width', '100%');
});
});
// Define a função para exibir a imagem da cobra em locais aleatórios
function showSnake() {
  var snake = document.getElementById("snake");
  var enclosure = document.getElementById("enclosure");
  var wrapper = document.querySelector(".snake-wrapper");
  var wrapperRect = wrapper.getBoundingClientRect();
  var x = Math.floor(Math.random() * (wrapperRect.width - snake.width));
  var y = Math.floor(Math.random() * (wrapperRect.height - snake.height));
  snake.style.left = x + "px";
  snake.style.top = y + "px";

  // Busca os valores de fome e sujeira da cobra usando AJAX
  $.ajax({
    url: 'obter_status_cobra.php',
    method: 'GET',
    data: { codigo_cobra: 1 }, 
    success: function(data) {
      var statusCobra = JSON.parse(data);
      
      var fome = statusCobra.fome;
      var sujeira = statusCobra.sujeira;

      if (fome < 20) {
        snake.src = 'hunger0.png';
      } else if (fome < 30) {
        snake.src = 'hunger1.png';
      } else if (fome < 50) {
        snake.src = 'hunger2.png';
      } else {
        snake.src = 'hunger3.png';
      }

      if (sujeira < 20) {
        enclosure.src = 'dirt0.png';
      } else if (sujeira < 30) {
        enclosure.src = 'dirt1.png';
      } else if (sujeira < 50) {
        enclosure.src = 'dirt2.png';
      } else {
        enclosure.src = 'dirt.png';
      }
    },
    error: function() {
      console.log('Erro ao obter os valores de fome e sujeira da cobra.');
    }
  });
}

setInterval(showSnake, 10000);


// Obtém a imagem da cobra
var snake = document.getElementById("snake");
var botaoModal = document.getElementById("optionsButton");

// Obtém a modal
var modalComida = document.getElementById("foodAndDirtModal");
var modalSalvar = document.getElementById("optionsModal");

// Obtém o botão de fechar a modal
var closeFoodAndDirtModal = document.getElementById("closeFoodAndDirtModal");
var closeOptionsModal = document.getElementById("closeOptionsModal");
var closeCardModal = document.getElementById("closeCardModal");
// Quando a imagem da cobra for clicada, mostra a modal
snake.onclick = function() {
  modalComida.style.display = "block";
}
botaoModal.onclick = function() {
  modalSalvar.style.display = "block";
}

// Quando o botão de fechar a modal for clicado, esconde a modal
closeFoodAndDirtModal.onclick = function() {
  modalComida.style.display = "none";
}
closeOptionsModal.onclick = function() {
  modalSalvar.style.display = "none";
}

// Quando o usuário clicar fora da modal, ela será fechada
window.onclick = function(event) {
  if (event.target == modalComida || event.target == modalSalvar) {
    modalComida.style.display = "none";
    modalSalvar.style.display = "none";
  }
}

$(document).ready(function() {
  // obtenha a largura externa da borda de phone-wrapper
  var phoneWidth = $('.phone-wrapper').outerWidth();
  // defina a largura da modal para a largura do telefone
  $('.modal').width(phoneWidth);
});


$('#saveGameButton').on('click', function() {
  hBarSujeira = $('#sujeira'),
  hBarComida = $('#comida'),
  
  valueSujeira = hBarSujeira.data('value');
  valueComida = hBarComida.data('value');
  console.log(valueSujeira, valueComida);

  $.post('saveCobra.php', {codigoCobra: 2, fome: valueComida, limpeza: valueSujeira},
  function(data) {
    if (data){
      console.log('Saved');
    }
    else {
      console.log('error');
    }
  })
});
