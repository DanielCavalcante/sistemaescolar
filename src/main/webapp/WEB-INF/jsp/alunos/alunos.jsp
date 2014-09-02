<h4><fmt:message key="aluno.cadastrar" /></h4>
<div class="form-group">
   	<label class="col-sm-2 control-label"><fmt:message key="aluno.nome" /></label>
   	<div class="col-sm-3">
   		<input name="aluno.nome" value="${aluno.nome}" type="text" class="form-control" placeholder="<fmt:message key="aluno.nome" />"/>
   	</div>
   	<label class="col-sm-2 control-label"><fmt:message key="aluno.data.label" /></label>
   	<div class="col-sm-3">
    	<div class='input-group date' id='datetimepicker'>
			<input name="aluno.dataNascimento" value='<fmt:formatDate value="${aluno.dataNascimento}" pattern="dd/MM/yyyy" />' placeholder="<fmt:message key="aluno.data.nascimento" />" type="text" class="form-control" />
			<span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
		</div>
   	</div>
</div>
<div class="form-group">
   	<label class="col-sm-2 control-label"><fmt:message key="aluno.filiacao.mae" /></label>
   	<div class="col-sm-3">
     		<input name="aluno.filiacaoMae" value="${aluno.filiacaoMae}" type="text" class="form-control" placeholder="<fmt:message key="aluno.filiacao.mae" />"/>
   	</div>
   	<label class="col-sm-2 control-label"><fmt:message key="aluno.filiacao.pai" /></label>
   	<div class="col-sm-3">
     		<input name="aluno.filiacaoPai" value="${aluno.filiacaoPai}" type="text" class="form-control" placeholder="<fmt:message key="aluno.filiacao.pai" />" />
   	</div>
</div>
<div class="form-group">
   	<label class="col-sm-2 control-label"><fmt:message key="aluno.raca" /></label>
   	<div class="col-sm-3">
   		<select name="aluno.raca" class="form-control">
			<option value=""><fmt:message key="menu.selecione" /></option>
			<c:forEach items="${listaRacas}" var="raca">
				<option value="${raca.label}" ${raca.label eq aluno.raca ? "selected='selected'" : ""}>${raca.label}</option>
			</c:forEach>
		</select>
  		</div>
   	<label class="col-sm-2 control-label"><fmt:message key="aluno.sexo" /></label>
   	<div class="col-sm-3">
  			<select name="aluno.sexo" class="form-control">
			<option value=""><fmt:message key="menu.selecione" /></option>
			<c:forEach items="${listaSexo}" var="sexo">
				<option value="${sexo.label}" ${sexo.label eq aluno.sexo ? "selected='selected'" : ""}>${sexo.label}</option>
			</c:forEach>
		</select>
   	</div>
</div>
<div class="form-group">
	<label class="col-sm-2 control-label"><fmt:message key="aluno.nacionalidade" /></label>
	<div class="col-sm-3">
		<select name="aluno.nacionalidade" id="aluno_nacionalidade" class="form-control">
			<option value=""><fmt:message key="menu.selecione" /></option>
			<c:forEach items="${listaNacionalidade}" var="n">
				<option value="${n.label}" ${n.label eq aluno.nacionalidade ? "selected='selected'" : ""}>${n.label}</option>
			</c:forEach>
		</select>
	</div>
	<label class="col-sm-2 control-label"><fmt:message key="aluno.uf.nascimento" /></label>
	<div class="col-sm-3">
		<select id="estadoSelect" name="aluno.estadoNascimento.id" class="form-control">
			<option value=""><fmt:message key="menu.selecione" /></option>
			<c:forEach items="${listaEstados}" var="uf">
				<option value="${uf.id}" ${uf.id eq aluno.estadoNascimento.id ? "selected='selected'" : ""}>${uf.nome}</option>
			</c:forEach>
		</select>
	</div>
</div>
<div class="form-group">
	<label class="col-sm-2 control-label"><fmt:message key="aluno.cidade" /></label>
	<div class="col-sm-3">
		<select id="cidadesSelect" name="aluno.cidadeNascimento.id" class="form-control">
			<option value=""><fmt:message key="menu.selecione" /></option>
		</select>
	</div>
</div>