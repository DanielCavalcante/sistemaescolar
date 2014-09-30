<h4><fmt:message key="endereco.cadastrar" /></h4>
<div class="form-group">
   	<label class="col-sm-2 control-label"><fmt:message key="endereco.cep" /></label>
   	<div class="col-sm-3">
   		<input name="aluno.endereco.cep" value="${aluno.endereco.cep}" maxlength="8" type="text" class="form-control" placeholder="<fmt:message key="endereco.cep" />" />
   	</div>
   	<label class="col-sm-1 control-label"><fmt:message key="endereco.endereco" /></label>
   	<div class="col-sm-3">
   		<input name="aluno.endereco.rua" value="${aluno.endereco.rua}" type="text" class="form-control" placeholder="<fmt:message key="endereco.endereco" />" />
   	</div>
</div>
<div class="form-group">
   	<label class="col-sm-2 control-label"><fmt:message key="endereco.complemento" /></label>
   	<div class="col-sm-3">
   		<input name="aluno.endereco.complemento" value="${aluno.endereco.complemento}" type="text" class="form-control" placeholder="<fmt:message key="endereco.complemento" />">
   	</div>
   	<label class="col-sm-1 control-label"><fmt:message key="endereco.bairro" /></label>
   	<div class="col-sm-3">
   		<input name="aluno.endereco.bairro" value="${aluno.endereco.bairro}" type="text" class="form-control" placeholder="<fmt:message key="endereco.bairro" />" />
   	</div>
</div>
<div class="form-group">
	<label class="col-sm-2 control-label"><fmt:message key="endereco.uf" /></label>
	<div class="col-sm-3">
		<select id="enderecoEstadosSelect" name="aluno.endereco.uf.id" class="form-control">
			<option value=""><fmt:message key="menu.selecione" /></option>
			<c:forEach items="${listaEstados}" var="uf">
				<option value="${uf.id}" ${uf.id eq aluno.endereco.uf.id ? "selected='selected'" : ""}>${uf.nome}</option>
			</c:forEach>
		</select>
	</div>
	<label class="col-sm-1 control-label"><fmt:message key="endereco.cidade" /></label>
	<div class="col-sm-3">
		<select id="enderecoCidadesSelect" name="aluno.endereco.cidade.id" class="form-control">
			<option value=""><fmt:message key="menu.selecione" /></option>
		</select>
	</div>
</div>
<div class="form-group">
	<label class="col-sm-2 control-label"><fmt:message key="aluno.deficiencia" /></label>
	<div class="col-sm-3">
		<input name="aluno.deficiencia" id="deficiencia" value="${aluno.deficiencia}" type="checkbox" checked="${aluno.deficiencia}"/> 
	</div>
</div>
<div class="form-group" id="deficiencias">
	<label class="col-sm-2 control-label"><fmt:message key="aluno.tipo.deficiencia" /></label>
	<div class="col-sm-3">	
		<c:forEach items="${listaDeficiencias}" var="item" varStatus="index">
			<div class="checkbox">
				<input name="deficiencias" type="checkbox" value="${item.nome}" ${item.checked ? "checked" : ""} /> <fmt:message key="${item.nome}" />
			</div>
		</c:forEach>
	</div>
</div>