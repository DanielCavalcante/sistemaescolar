<h3><fmt:message key="turmas.cadastrar" /></h3>
	<div class="form-group">
		<label class="col-sm-2 control-label"><fmt:message key="turma.codigo" /></label>
		<div class="col-sm-3">
			<input name="turma.codigoEscola" value="${turma.codigoEscola}" type="text" class="form-control" placeholder="<fmt:message key="turma.codigo.turma" />">
		</div>
		<label class="col-sm-2 control-label"><fmt:message key="turma.nome" /></label>
		<div class="col-sm-3">
			<input name="turma.nome" value="${turma.nome}" class="form-control" type="text" placeholder="<fmt:message key="turma.nome.turma" />">
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-2 control-label" for="turma.horaInicio"><fmt:message key="turma.hora.inicio" /></label>
		<div class="col-sm-3">
			<div class='input-group date' id='datetimepickerHoraInicio'>
				<input name="turma.horaInicio" value="${turma.horaInicio}" type="text" class="form-control" placeholder="<fmt:message key="turma.hora.inicio" />">
				<span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
			</div>
		</div>
		<label class="col-sm-2 control-label" for="turma.horaFinal"><fmt:message key="turma.hora.final" /></label>
		<div class="col-sm-3">
			<div class='input-group date' id='datetimepickerHoraFinal'>
				<input name="turma.horaFinal" value="${turma.horaFinal}" type="text" class="form-control" placeholder="<fmt:message key="turma.hora.final" />">
				<span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
			</div>
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-2 control-label" for="turma.etapa"><fmt:message key="turma.etapa" /></label>
		<div class="col-sm-3">
			<input name="turma.etapa" value="${turma.etapa}" type="text" class="form-control" placeholder="<fmt:message key="turma.etapa" />">
		</div>
		<label class="col-sm-2 control-label" for="turma.modalidade"><fmt:message key="turma.modalidade" /></label>
		<div class="col-sm-3">
			<input name="turma.modalidade" value="${turma.modalidade}" type="text" class="form-control" placeholder="<fmt:message key="turma.modalidade" />">
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-2 control-label"><fmt:message key="turma.atividade.complementar" /></label>
		<div class="col-sm-3">
			<input name="turma.atividadeComplementar" value="${turma.atividadeComplementar}" type="text" class="form-control" placeholder="<fmt:message key="turma.atividade.complementar" />">
		</div>
		
		<!-- Professor da turma -->
<%-- 		<label class="col-sm-2 control-label"><fmt:message key="turma.professor" /></label> --%>
<!-- 		<div class="col-sm-3"> -->
<!-- 			<select name="turma.professor" class="form-control"> -->
<%-- 				<option value=""><fmt:message key="menu.selecione" /></option> --%>
<%-- 				<c:forEach items="${listaProfessores}" var="p"> --%>
<%-- 					<option value="${p.id}">${p.nome}</option> --%>
<%-- 				</c:forEach> --%>
<!-- 			</select> -->
<!-- 		</div> -->
	</div>