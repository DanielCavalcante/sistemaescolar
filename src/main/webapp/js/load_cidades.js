new UFCidadeLoader('estadoSelect', 'cidadesSelect', idCidadeNascimento.value);
new UFCidadeLoader('enderecoEstadosSelect', 'enderecoCidadesSelect', idCidadeEndereco.value);
new UFCidadeLoader('documentoEstadoSelect', 'documentoCidadesSelect', idCidadeCartorio.value);
	
function UFCidadeLoader(idUf, idCidade, cidadeDefaultValue){
	var uf = document.getElementById(idUf);
	uf.cidadeDefaultValue = cidadeDefaultValue;
	uf.idCidade = idCidade;
	this.uf = uf;
	
	uf.onchange = function(idCidade) {
		var cidade = document.getElementById(this.idCidade, this.cidadeDefaultValue);
		$.ajax({
			url:URL+'/recuperaCidades', 
			data:{uf:uf.value},
			success:function(data) {
				if(data.map.sucesso == 'true') {
					var cidades = eval("("+data.map.dados+")");
					var options = [];
					//options.push('<option>Selecione</option>');
					for (var i = 0; i < cidades.length; i++) {
						options.push("<option value='"+cidades[i].id+"'>"+cidades[i].nome+"</option>");
					}
				}
				$('#'+uf.idCidade).html(options.join(''));
				if (cidadeDefaultValue && cidadeDefaultValue != '') {
					cidade.value = cidadeDefaultValue;
				}
			},
			error:function() {
				console.log(data);
			}
		});
		this.cidadeDefaultValue = null;
	};
		
	if (this.uf.cidadeDefaultValue) {
		uf.onchange();
	}
}