<form class="form-horizontal" method="post" action='<c:url value="/escola/save"></c:url>'>
	<input type="hidden" name="escola.id" value="${escola.id}" />
	<input type="hidden" id="idCidadeNascimento" value="${escola.endereco.uf.id}" />
	<input type="hidden" id="idCidadeEndereco" value="${escola.endereco.cidade.id}" />
	<div class="row">
		<div class="form-inline">
			<div class="col-lg-3">
				<button type="submit" class="btn btn-success"> 
					<span class="glyphicon glyphicon-ok"></span> <fmt:message key="button.save" />
				</button>
			</div>
		</div>
	</div>
	<div class="row">
		<h4><fmt:message key="msg.escola.informacoes" /></h4>
		
		<div class="form-group">
			<label class="col-sm-2 control-label"><fmt:message key="escola.nome" /></label>
			<div class="col-sm-3">
				<input name="escola.nome" value="${escola.nome}" type="text" class="form-control" placeholder="<fmt:message key="escola.nome" />" />
			</div>
			<label class="col-sm-2 control-label"><fmt:message key="escola.codigo" /></label>
			<div class="col-sm-3">
				<input name="escola.codigoEscola" value="${escola.codigoEscola}" type="text" class="form-control" placeholder="<fmt:message key="escola.codigo" />" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label"><fmt:message key="escola.cnpj" /></label>
			<div class="col-sm-3">
				<input name="escola.cnpj" value="${escola.cnpj}" type="text" class="form-control" placeholder="<fmt:message key="escola.cnpj" />" />
			</div>
			<label class="col-sm-2 control-label"><fmt:message key="escola.telefone" /></label>
			<div class="col-sm-3">
				<input name="escola.telefone" value="${escola.telefone}" type="text" class="form-control" placeholder="<fmt:message key="escola.telefone" />" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label"><fmt:message key="escola.fax" /></label>
			<div class="col-sm-3">
				<input name="escola.fax" value="${escola.fax}" type="text" class="form-control" placeholder="<fmt:message key="escola.fax" />" />
			</div>
			<label class="col-sm-2 control-label"><fmt:message key="escola.email" /></label>
			<div class="col-sm-3">
				<input name="escola.email" value="${escola.email}" type="text" class="form-control" placeholder="<fmt:message key="escola.email" />" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label"><fmt:message key="escola.codigo.orgao.regional" /></label>
			<div class="col-sm-3">
				<input name="escola.codigoOrgaoRegional" value="${escola.codigoOrgaoRegional}" type="text" class="form-control" placeholder="<fmt:message key="escola.codigo.orgao.regional.place.holder" />" />
			</div>
			<label class="col-sm-2 control-label"><fmt:message key="escola.nome.orgao.regional" /></label>
			<div class="col-sm-3">
				<input name="escola.nomeOrgaoRegional" value="${escola.nomeOrgaoRegional}" type="text" class="form-control" placeholder="<fmt:message key="escola.nome.orgao.regional.place.holder" />" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label"><fmt:message key="escola.dependencia.administrativa" /></label>
			<div class="col-sm-3">
				<input name="escola.dependenciaAdministrativa" value="${escola.dependenciaAdministrativa}" type="text" class="form-control" placeholder="<fmt:message key="escola.dependencia.administrativa.place.holder" />" />
			</div>
			<label class="col-sm-2 control-label"><fmt:message key="escola.endereco.cep" /></label>
			<div class="col-sm-3">
				<input name="escola.endereco.cep" value="${escola.endereco.cep}" type="text" class="form-control" placeholder="<fmt:message key="escola.endereco.cep" />" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label"><fmt:message key="escola.endereco" /></label>
			<div class="col-sm-3">
				<input name="escola.endereco.rua" value="${escola.endereco.rua}" type="text" class="form-control" placeholder="<fmt:message key="escola.endereco" />" />
			</div>
			<label class="col-sm-2 control-label"><fmt:message key="escola.endereco.bairro" /></label>
			<div class="col-sm-3">
				<input name="escola.endereco.bairro" value="${escola.endereco.bairro}" type="text" class="form-control" placeholder="<fmt:message key="escola.endereco.bairro" />" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label"><fmt:message key="escola.endereco.estado" /></label>
			<div class="col-sm-3">
				<select id="estadoSelect" name="escola.endereco.uf.id" class="form-control">
					<option value=""><fmt:message key="menu.selecione" /></option>
					<c:forEach items="${estadoList}" var="e">
						<option value="${e.id}" ${e.id eq escola.endereco.uf.id ? "selected='selected'" : ""}>${e.nome}</option>
					</c:forEach>
				</select>
			</div>
			<label class="col-sm-2 control-label"><fmt:message key="escola.endereco.cidade" /></label>
			<div class="col-sm-3">
				<select id="cidadesSelect" name="escola.endereco.cidade.id" class="form-control">
					<option value=""><fmt:message key="menu.selecione" /></option>
				</select>
			</div>
		</div>
	</div>
	<js:import javascript="/js/load_cidades.js"></js:import>
</form>