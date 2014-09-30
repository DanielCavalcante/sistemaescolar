function modeloCertidao() {
	var modelo = $("#modeloCertidao").val();
	if (modelo != 'Modelo antigo' && modelo != 'Modelo novo') {
		$('#modeloNovo').hide();
		$('#modeloAntigo').hide();
    } else if (modelo === 'Modelo antigo') {
		$('#modeloNovo').hide();
		$('#modeloAntigo').show(); 
	} else if (modelo === 'Modelo novo') {
		$('#modeloAntigo').hide();
		$('#modeloNovo').show();
	}
}
$(document).ready(function(){
	modeloCertidao();
	nacionalidade();
});
$('#modeloCertidao').change(function(){
	modeloCertidao();
});
$('#nacionalidade').change(function(){
	nacionalidade();
});
function nacionalidade() {
	var nacionalidade = $("#nacionalidade").val();
	if (nacionalidade === 'Brasileiro') {
		$("#estadoCidade").show();
	} else {
		$("#estadoCidade").hide();
	}
}
$(function () {
    $('#professorDataNascimento').datetimepicker({
        pickTime: false,
        language: 'pt-BR',
        useCurrent: false
    });
});
$(function () {
    $('#professorDataExpedicao').datetimepicker({
        pickTime: false,
        language: 'pt-BR',
        useCurrent: false
    });
});