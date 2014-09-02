<form class="form-horizontal" method="post">
	<input type="hidden" name="perfil.id" value="${perfil.id}" />
	<div class="row">
		<div class="form-inline">
			<div class="col-lg-3">
				<permissao:liberada permissoes="perfil_listar">
					<a href='<c:url value="/perfis" />' class="btn btn-default">
						<span class="glyphicon glyphicon-arrow-left"></span> <fmt:message key="button.back" />
					</a>
				</permissao:liberada>
				<permissao:liberada permissoes="perfil_criar,perfil_editar">
					<button onclick="save()" class="btn btn-success">
						<span class="glyphicon glyphicon-ok"></span> <fmt:message key="button.save" />
					</button>
				</permissao:liberada>
			</div>
		</div>
	</div>
	<h3><fmt:message key="perfil.cadastrar" /> </h3>
	<div class="form-group">
		<label class="col-sm-2 control-label"><fmt:message key="perfil.nome" /></label>
		<div class="col-sm-4">
			<input name="perfil.nome" value="${perfil.nome}" type="text" placeholder="<fmt:message key="perfil.nome" />" class="form-control" />
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-2 control-label"><fmt:message key="perfil.permissoes" /></label>
		<div class="col-sm-4">
			<c:forEach items="${permissaoList}" var="p">
				<div class="checkbox">
					<input name="listaPermissoes" value="${p.nome}" type="checkbox" ${p.checked ? "checked" : ""}/>
					<fmt:message key="${p.nome}" />
				</div>
			</c:forEach>
		</div>
	</div>
</form>
<script>
function save() {
	document.forms[0].action = "<c:url value='/perfis/save'/>";
	document.forms[0].submit();
}
</script>