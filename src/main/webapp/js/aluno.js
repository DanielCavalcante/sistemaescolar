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
	$('input[type="checkbox"]').click(function(){
        if($(this).prop("checked") == true){
            $("#deficiencias").show();
        }
        else if($(this).prop("checked") == false){
        	$("#deficiencias").hide();
        }
    });
	nacionalidade();
});
$('#modeloCertidao').change(function(){
	modeloCertidao();
});
$('#alunoNacionalidade').change(function(){
	nacionalidade();
});
function nacionalidade() {
	var nacionalidade = $("#alunoNacionalidade").val();
	if (nacionalidade === 'Brasileiro') {
		$("#estado").show();
		$("#cidade").show();
	} else {
		$("#estado").hide();
		$("#cidade").hide();
	}
}
$(function () {
    $('#datetimepicker').datetimepicker({
        pickTime: false,
        language: 'pt-BR',
        useCurrent: false
    });
});
$(function () {
    $('#datetimepicker2').datetimepicker({
        pickTime: false,
        language: 'pt-BR',
        useCurrent: false
    });
});
$(function () {
    $('#dataExpedicao').datetimepicker({
        pickTime: false,
        language: 'pt-BR',
        useCurrent: false
    });
});