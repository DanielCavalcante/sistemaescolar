<h4><fmt:message key="professor.cadastrar" /></h4>
<div class="form-group">
   	<label class="col-sm-2 control-label"><fmt:message key="professor.nome" /></label>
   	<div class="col-sm-3">
   		<input name="professor.nome" value="${professor.nome}" type="text" class="form-control" placeholder="<fmt:message key="professor.nome" />">
   	</div>
   	<label class="col-sm-2 control-label"><fmt:message key="professor.datanascimento" /></label>
   	<div class="col-sm-3">
	   	<div class='input-group date' id='professorDataNascimento'>
	   		<input name="professor.dataNascimento" value="${professor.dataNascimento}" type="text" class="form-control" placeholder="<fmt:message key="placeholder.professor.datanascimento" />">
			<span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
		</div>
  	</div>
</div>
<div ng-controller="nacionalidadeController">
	<div class="form-group">
		<label class="col-sm-2 control-label"><fmt:message key="professor.sexo" /></label>
    	<div class="col-sm-3">
   			<select name="professor.sexo" class="form-control">
				<option value=""><fmt:message key="menu.selecione" /></option>
				<c:forEach items="${listaSexo}" var="sexo">
					<option value="${sexo.label}">${sexo.label}</option>
				</c:forEach>
			</select>
    	</div>
		<label class="col-sm-2 control-label"><fmt:message key="professor.nacionalidade" /></label>
    	<div class="col-sm-3">
   			<select name="professor.nacionalidade" ng-model="nacionalidadeSelection" class="form-control">
   				<option value=""><fmt:message key="menu.selecione" /></option>
				<c:forEach items="${listaNacionalidade}" var="n">
					<option value="${n.label}">${n.label}</option>
				</c:forEach>
			</select>
    	</div>
	</div>
	<div ng-show="isNacionalidadeSelected('Brasileiro')" class="form-group">
		<label class="col-sm-2 control-label"><fmt:message key="professor.ufnascimento" /></label>
		<div class="col-sm-3">
			<select id="estadoSelect" class="form-control" name="professor.estadoNascimento.id">
				<option value=""><fmt:message key="menu.selecione" /></option>
				<c:forEach items="${listaEstados}" var="uf">
					<option value="${uf.id}">${uf.nome}</option>
				</c:forEach>
			</select>
		</div>
		<label class="col-sm-2 control-label"><fmt:message key="professor.cidade" /></label>
		<div class="col-sm-3">
			<select id="cidadesSelect" name="professor.cidadeNascimento.id" class="form-control">
				<option value=""><fmt:message key="menu.selecione" /></option>
			</select>
		</div>
	</div>
</div>