<h4><fmt:message key="aluno.vincular.turma" /></h4>
<div class="form-group">
	<div class="col-md-3">
		<label class="col-sm-2 control-label"><fmt:message key="aluno.nome.turma" /></label>
		<c:forEach items="${listaTurmas}" var="t">
			<div class="checkbox">
				<input name="aluno.turmas.id" value="${t.nome}" type="checkbox" />
				${t.codigoEscola} - ${t.nome}
			</div>
		</c:forEach>
	</div>
</div>
