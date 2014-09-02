<form>
	<div class="row">
		<div class="form-inline">
			<div class="col-lg-3">
				<permissao:liberada permissoes="aluno_deletar">
					<button onclick="del()" class="btn btn-danger">
						<span class="glyphicon glyphicon-remove"></span> <fmt:message key="button.delete" />
					</button>
				</permissao:liberada>
				<button onclick="novo()" class="btn btn-success">
					<span class="glyphicon glyphicon-plus"></span> <fmt:message key="button.new" />
				</button>
			</div>
			<div class="col-lg-4" style="margin-left: 100px;">
				<div class="input-group">
					<input name="filtro.nome" value="${filtro.nome}" type="text" class="form-control" placeholder="<fmt:message key="filtro.pesquisar.nome" />">
					<span class="input-group-btn">
						<a href="javascript:void(0)" onclick="filtro()" class="btn btn-default"><fmt:message key="button.search" /></a>
					</span>
				</div>
			</div>
		</div>
	</div>
	<c:if test="${!empty alunoList}">
		<h3><fmt:message key="aluno.lista" /></h3>
		<table class="table table-hover">
			<thead>
				<tr> 
					<th style="width: 20px;">
						<input type="checkbox" onclick="selectAll(this, 'id')" class="checkbox">
					</th>
					<th><fmt:message key="aluno.nome" /></th>
					<th><fmt:message key="aluno.data.nascimento" /></th>
					<th><fmt:message key="aluno.filiacao.mae" /></th>
					<th><fmt:message key="aluno.filiacao.pai" /></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${alunoList}" var="aluno">
					<tr>
						<td><input type="checkbox" value="${aluno.id}" name="id"></td>
						<td><a href="javascript:void(0)" onclick="edit(${aluno.id})">${aluno.nome}</a></td>
						<td><fmt:formatDate value="${aluno.dataNascimento}"/></td>
						<td>${aluno.filiacaoMae}</td>
						<td>${aluno.filiacaoPai}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:if>
</form>
<script>
function edit(id){
	document.forms[0].action = "<c:url value='/alunos/edit/"+id+"'/>";
	document.forms[0].submit();
}
function novo() {
	document.forms[0].action = "<c:url value='/alunos/form'/>";
	document.forms[0].submit();
}
function del() {
	document.forms[0].action = "<c:url value='/alunos/delete'/>";
	document.forms[0].submit();	
}
function filtro() {
	document.forms[0].action = "<c:url value='/alunos'/>";
	document.forms[0].submit();	
}
</script>