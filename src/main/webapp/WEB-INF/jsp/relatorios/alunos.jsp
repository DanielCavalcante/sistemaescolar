<form action="<c:url value="/relatorios/alunoRelatorio" />" method="get">
	<a onclick="relatorio()" class="btn btn-success"><fmt:message key="button.relatorio" /></a>
	<h3><fmt:message key="relatorio.msg.aluno" /></h3>
	<div class="col-md-5">
		<div class="form-group">
			<label><fmt:message key="relatorio.aluno.msg.aluno.por.turma" /></label>
			<select name="filtro.turma" class="form-control">
				<c:forEach items="${listTurmas}" var="t">
					<option value="${t.id}">${t.codigoEscola} - ${t.nome}</option>
				</c:forEach>
			</select>
		</div>
		<div class="form-group">
			<label><fmt:message key="realtorio.aluno.genero" /></label>
			<select name="filtro.sexo" class="form-control">
				<option value=""><fmt:message key="filtro.pesquisar.todos" /></option>
				<c:forEach items="${listaSexos}" var="s">
					<option value="${s.label}">${s.label}</option>
				</c:forEach>
			</select>
		</div>
		<div class="form-inline form-group">
			<h4><fmt:message key="relatorio.aluno.outras.opecoes" /></h4>
			<label><fmt:message key="deficiencia.aluno" /></label>
			<input name="filtro.deficiencia" type="checkbox" class="checkbox" />
		</div>
	</div>
</form>
<script>
function relatorio() {
	document.forms[0].target = "_blank";
	document.forms[0].submit();
}
</script>