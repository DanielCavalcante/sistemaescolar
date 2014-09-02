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
	<c:if test="${!empty professorList}">
		<div class="page-header">
			<h3><fmt:message key="professor.lista" /></h3>
		</div>
		<table class="table table-condensed">
			<thead>
				<tr>
					<th style="width: 20px;">
						<input type="checkbox" onclick="selectAll(this, 'id')" class="checkbox"/>
					</th>
					<th><fmt:message key="professor.nome" /></th>
					<th><fmt:message key="professor.datanascimento" /></th>
					<th><fmt:message key="professor.sexo" /></th>
					<th><fmt:message key="professor.ufnascimento" /></th>
					<th><fmt:message key="professor.cidade" /></th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${professorList}" var="p">
					<tr>
						<td><input type="checkbox" value="${p.id}" name="id"></td>
						<td><a href="javascript:void(0)" onclick="edit(${p.id})">${p.nome}</a></td>
						<td><fmt:formatDate value="${p.dataNascimento}"/></td>
						<td>${p.sexo}</td>
						<td>${p.estadoNascimento.nome}</td>
						<td>${p.cidadeNascimento.nome}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:if>
</form>
<script>
function novo() {
	document.forms[0].action = "<c:url value='/professores/form'/>";
	document.forms[0].submit();
}
function edit(id) {
	document.forms[0].action = "<c:url value='/professores/edit/"+id+"'/>";
	document.forms[0].submit();
}
function del() {
	document.forms[0].action = "<c:url value='/professores/delete'/>";
	document.forms[0].submit();
}
function filtro() {
	document.forms[0].action = "<c:url value='/professores'/>";
	document.forms[0].submit();
}
</script>