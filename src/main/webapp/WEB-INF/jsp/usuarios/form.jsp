<form action="<c:url value='/usuarios/save' />" method="post" class="form-horizontal">
	<input type="hidden" name="usuario.id" value="${usuario.id}" />
	<div class="row">
		<div class="form-inline">
			<div class="col-lg-3">
				<c:if test="${!alterarMeusDados}">
					<a href="<c:url value='/usuarios'/>" class="btn btn-default">
						<span class="glyphicon glyphicon-arrow-left"></span> <fmt:message key="button.back" />
					</a>
				</c:if>
				<button type="submit" class="btn btn-success">
					<span class="glyphicon glyphicon-ok"></span> <fmt:message key="button.save" />
				</button>
			</div>
		</div>
	</div>
	<div class="row">
		<c:if test="${alterarMeusDados}">
			<h3><fmt:message key="msg.usuario.atualiza.informacoes" /></h3>			
		</c:if>
		<c:if test="${!alterarMeusDados}">
			<h3><fmt:message key="usuario.cadastrar" /></h3>
		</c:if>
		<div class="form-group">
			<label class="col-sm-2 control-label"><fmt:message key="usuario.nome" /></label>
			<div class="col-sm-4">
				<input name="usuario.nome" value="${usuario.nome}" placeholder='<fmt:message key="placeholder.usuario.nome" />' type="text" class="form-control" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label"><fmt:message key="usuario.login" /></label>
			<div class="col-sm-4">
				<input name="usuario.login" value="${usuario.login}" placeholder="<fmt:message key="placeholder.usuario.login" />" type="text" class="form-control" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label"><fmt:message key="usuario.senha" /></label>
			<div class="col-sm-4">
				<input name="usuario.senha" value="${usuario.senha}" placeholder="<fmt:message key="placeholder.usuario.senha" />" type="text" class="form-control" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label"><fmt:message key="usuario.perfil" /></label>
			<div class="col-sm-4">
				<select name="usuario.perfil.id" class="form-control">
					<option value=""><fmt:message key="menu.selecione" /></option>
					<c:forEach items="${listaPerfil}" var="p">
						<option value="${p.id}" ${p.id eq usuario.perfil.id ? 'selected' : ''}>${p.nome}</option>
					</c:forEach>
				</select>
			</div>
		</div>
	</div>
</form>
<js:import javascript="/js/usuario.js"></js:import>
