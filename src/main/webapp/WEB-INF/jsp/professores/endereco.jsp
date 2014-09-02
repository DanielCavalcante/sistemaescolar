<h4><fmt:message key="endereco.residencial" /></h4>
<div class="form-group">
	<label class="col-sm-2 control-label"><fmt:message key="endereco.cep" /></label>
	<div class="col-sm-3">
		<input name="professor.endereco.cep" value="${professor.endereco.cep}" type="text" class="form-control" placeholder="<fmt:message key='endereco.cep' />" />
	</div>
	<label class="col-sm-2 control-label"><fmt:message key="endereco.endereco" /></label>
	<div class="col-sm-3">
		<input name="professor.endereco.rua" value="${professor.endereco.rua}" type="text" class="form-control" placeholder="<fmt:message key='endereco.endereco' />" />
	</div>
</div>
<div class="form-group">
	<label class="col-sm-2 control-label"><fmt:message key="endereco.complemento" /></label>
	<div class="col-sm-3">
		<input name="professor.endereco.complemento" value="${professor.endereco.complemento}" type="text" class="form-control" placeholder="<fmt:message key='endereco.complemento' />" />
	</div>
	<label class="col-sm-2 control-label"><fmt:message key="endereco.bairro" /></label>
	<div class="col-sm-3">
		<input name="professor.endereco.bairro" value="${professor.endereco.bairro}" type="text" class="form-control" placeholder="<fmt:message key='endereco.bairro' />" />
	</div>
</div>
<div class="form-group">
	<label for="" class="col-sm-2 control-label"><fmt:message key="endereco.uf" /></label>
	<div class="col-sm-3">
		<select id="enderecoEstadosSelect" class="form-control" name="professor.endereco.uf.id">
			<option value=""><fmt:message key="menu.selecione" /></option>
			<c:forEach items="${listaEstados}" var="uf">
				<option value="${uf.id}" ${uf.id eq professor.endereco.uf.id ? "selected='selected'" : ""}>${uf.nome}</option>
			</c:forEach>
		</select>
	</div>
	<label for="" class="col-sm-2 control-label"><fmt:message key="endereco.cidade" /></label>
	<div class="col-sm-3">
		<select id="enderecoCidadesSelect" name="professor.endereco.cidade.id" class="form-control">
			<option><fmt:message key="menu.selecione" /></option>
		</select>
	</div>
</div>