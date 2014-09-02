$('#modeloCertidao').change(function() {
	var modelo = $(this).val();
	if (modelo === 'Modelo novo') {
		$('#modeloAntigo').hide();
		$('#modeloNovo').show();
	} else if (modelo === 'Modelo antigo') {
		$('#modeloNovo').hide();
		$('#modeloAntigo').show();
		
	} else if (modelo != 'Modelo antigo' && modelo != 'Modelo novo') {
		$('#modeloNovo').hide();
		$('#modeloAntigo').hide();
	}
});
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
