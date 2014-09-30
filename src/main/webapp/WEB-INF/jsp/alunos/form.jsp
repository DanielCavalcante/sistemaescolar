<form method="post" class="form-horizontal">	
	<input type="hidden" id="alunoId" value="${aluno.id}" name="aluno.id" />
	<input type="hidden" id="idCidadeNascimento" value="${aluno.cidadeNascimento.id}" />
	<input type="hidden" id="idCidadeCartorio" value="${aluno.documento.cidadeCartorio.id}" />
	<input type="hidden" id="idCidadeEndereco" value="${aluno.endereco.cidade.id}" />
	<div class="row">
		<div class="form-inline">
			<div class="col-lg-3">
				<a href="<c:url value='/alunos'/>" class="btn btn-default">
					<span class="glyphicon glyphicon-arrow-left"></span> <fmt:message key="button.back" />
				</a>
				<a onclick="save()" type="submit" class="btn btn-success">
					<span class="glyphicon glyphicon-ok"></span> <fmt:message key="button.save" />
				</a>
			</div>
		</div>
	</div>
	<div class="row">
		<ul class="nav nav-tabs" id="myTab" style="margin-top: 10px;">
			<li class="active"><a href="#informacoes" data-toggle="tab"><fmt:message key="menu.informacoes" /></a></li>
			<li><a href="#documento" data-toggle="tab"><fmt:message key="menu.documento" /></a></li>
			<li><a href="#endereco" data-toggle="tab"><fmt:message key="menu.endereco" /></a></li>
			<li><a href="#turma" data-toggle="tab"><fmt:message key="menu.turma" /></a></li>
		</ul>
	</div>
	<div class="tab-content">
		<div class="tab-pane active" id="informacoes">
			<jsp:include page="alunos.jsp"></jsp:include>
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
</form>
<js:import javascript="/js/aluno.js"></js:import>
<js:import javascript="/js/load_cidades.js"></js:import>
<script>
function save() {
	document.forms[0].action = "<c:url value='/alunos/save'/>";
	document.forms[0].submit();
}
</script>