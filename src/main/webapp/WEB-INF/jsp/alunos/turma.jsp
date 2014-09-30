<h4><fmt:message key="aluno.vincular.turma" /></h4>
<div class="form-group">
	<c:forEach items="${listaTurmas}" var="t" varStatus="index">
		<label class="col-sm-2 control-label"><fmt:message key="aluno.nome.turma" /></label>
		<div class="col-sm-3">
			<div class="checkbox">
				<input name="aluno.turmas[${index.index}].id" value="${t.id}" type="checkbox" />${t.codigoEscola} - ${t.nome}
			</div>
		</div>
	</c:forEach>
</div>
