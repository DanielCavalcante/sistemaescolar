<form action="<c:url value='/professores/save' />" method="post" class="form-horizontal">
	<input type="hidden" name="professor.id" value="${professor.id}" />
	<input type="hidden" id="idCidadeNascimento" value="${professor.cidadeNascimento.id}" />
	<input type="hidden" id="idCidadeCartorio" value="${professor.cidadeCartorio.id}" />
	<input type="hidden" id="idCidadeEndereco" value="${professor.estadoNascimento.id}" />
	
	<div class="row">
		<div class="form-inline">
			<button onclick="voltar()" class="btn btn-default"> 
				<span class="glyphicon glyphicon-arrow-left"></span> <fmt:message key="button.back" />
			</button>
			<button class="btn btn-success" type="submit">
				<span class="glyphicon glyphicon-ok"></span> <fmt:message key="button.save" />
			</button>
		</div>
	</div>
	<div class="row">
		<ul class="nav nav-tabs" id="myTab" style="margin-top: 10px">
			<li class="active"><a href="#professor" data-toggle="tab"><fmt:message key="menu.informacoes" /></a></li>
			<li><a href="#documento" data-toggle="tab"><fmt:message key="menu.documento" /></a></li>
			<li><a href="#endereco" data-toggle="tab"><fmt:message key="menu.endereco" /></a></li>
			<li><a href="#turma" data-toggle="tab"><fmt:message key="menu.turma" /></a></li>
		</ul>
	</div>
	<div class="row">
		<div class="tab-content">
			<div class="tab-pane active" id="professor">
				<jsp:include page="professores.jsp"></jsp:include>
			</div>
			<div class="tab-pane" id="documento">
				<jsp:include page="documento.jsp"></jsp:include>
			</div>
			<div class="tab-pane" id="endereco">
				<jsp:include page="endereco.jsp"></jsp:include>
			</div>
			<div class="tab-pane" id="turma">
				<jsp:include page="turma.jsp"></jsp:include>
			</div>
		</div>
	</div>
</form>
<js:import javascript="/js/professor.js"></js:import>
<js:import javascript="/js/load_cidades.js"></js:import>
<script>
function save(){
	document.form.submit();
}
function voltar(){
	document.forms[0].action = "<c:url value='/professores'/>";
}
</script>