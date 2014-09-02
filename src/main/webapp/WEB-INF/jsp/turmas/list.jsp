<form>
	<div class="row">
		<div class="form-inline">
			<div class="col-lg-3">
				<button onclick="del()" class="btn btn-danger">
					<span class="glyphicon glyphicon-remove"></span> <fmt:message key="button.delete" />
				</button>
				<button onclick="novo()" class="btn btn-success">
					<span class="glyphicon glyphicon-plus"></span> <fmt:message key="button.new" />
				</button>
			</div>
			<div class="col-lg-4" style="margin-left: 100px;">
				<div class="input-group">
					<input name="filtro.nome" value="${filtro.nome}" type="text" class="form-control" placeholder='<fmt:message key="button.search" />'>
					<span class="input-group-btn">
						<a href="javascript:void(0)" onclick="filtro()" class="btn btn-default"><fmt:message key="button.search" /></a>
					</span>
				</div>
			</div>
		</div>
	</div>
	<c:if test="${!empty turmaList}">
		<h3><fmt:message key="turmas.listar" /></h3>
		<table class="table table-hover">
			<thead>
				<tr>
					<th style="width: 20px;">
						<input type="checkbox" onclick="selectAll(this, 'id')" class="checkbox"/>
					</th>
					<th><fmt:message key="turma.codigo.turma" /></th>
					<th><fmt:message key="turma.nome" /></th>
					<th><fmt:message key="turma.hora.inicio" /></th>
					<th><fmt:message key="turma.hora.final" /></th>
					<th><fmt:message key="turma.etapa" /></th>
					<th><fmt:message key="turma.modalidade" /></th>
					<th><fmt:message key="turma.atividade.complementar" /></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${turmaList}" var="t">
					<tr>
						<td><input name="id" value="${t.id}" type="checkbox"></td>
						<td><a href="javascript:void(0)" onclick="edit(${t.id})">${t.codigoEscola}</a></td>
						<td><a href="javascript:void(0)" onclick="edit(${t.id})"> ${t.nome}</a></td>
						<td>${t.horaInicio}</td>
						<td>${t.horaFinal}</td>
						<td>${t.etapa}</td>
						<td>${t.modalidade}</td>
						<td>${t.atividadeComplementar}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:if>	
</form>
<script>
function del(){
	document.forms[0].action = "<c:url value='/turmas/delete'/>";
	document.forms[0].submit();
}
function edit(id){
	document.forms[0].action = "<c:url value='/turmas/edit/"+id+"'/>";
	document.forms[0].submit();
}
function novo() {
	document.forms[0].action = "<c:url value='/turmas/form'/>";
	document.forms[0].submit();
}
function filtro() {
	document.forms[0].action = "<c:url value='/turmas'/>";
	document.forms[0].submit();
}
</script>