<form>
	<div class="row">
		<div class="form-inline">
			<div class="col-lg-3">
				<button onclick="del()" class="btn btn-danger">
					<span class="glyphicon glyphicon-remove"></span> <fmt:message key="button.delete" />
				</button>
				<button onclick="create()" class="btn btn-success">
					<span class="glyphicon glyphicon-plus"></span> <fmt:message key="button.new" />
				</button>
			</div>
		</div>
	</div>
	<c:if test="${!empty usuarioList}">
		<h3><fmt:message key="usuario.lista" /></h3>
		<table class="table table-hover">
			<thead>
				<tr>
					<th style="width: 20px;">
						<input type="checkbox" onclick="selectAll(this, 'id')" class="checkbox"/>
					</th>
					<th><fmt:message key="usuario.nome" /></th>
					<th><fmt:message key="usuario.login" /></th>
					<th><fmt:message key="usuario.senha" /></th>
					<th><fmt:message key="usuario.perfil" /></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${usuarioList}" var="usuario">
					<tr>
						<td><input name="id" value="${usuario.id}" type="checkbox"></td>
						<td><a href="javascript:void(0)" onclick="edit(${usuario.id})">${usuario.nome}</a></td>
						<td>${usuario.login}</td>
						<td>${usuario.senha}</td>
						<td>${usuario.perfil.nome}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:if>
</form>
<script>
function create() {
	document.forms[0].action = "<c:url value='/usuarios/form'/>";
	document.forms[0].submit();
}
function edit(id) {
	document.forms[0].action = "<c:url value='/usuarios/edit/"+id+"'/>";
	document.forms[0].submit();
}
function del() {
	document.forms[0].action = "<c:url value='/usuarios/delete'/>";
	document.forms[0].submit();
}
</script>