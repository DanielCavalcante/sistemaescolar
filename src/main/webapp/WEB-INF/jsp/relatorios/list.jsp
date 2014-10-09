<div class="row">
	<div class="col-lg-12">
		<h3><fmt:message key="relatorios" /></h3>
	</div>
</div>

<div class="row text-center">
	<div class="col-md-4 col-sm-6 hero-feature">
		<div class="thumbnail">
			<div class="caption">
				<h4><fmt:message key="relatorio.aluno" /></h4>
				<p><fmt:message key="relatorio.msg.aluno" /></p>
				<p>
					<a href="<c:url value="/relatorios/alunos"></c:url>" class="btn btn-primary">
						<fmt:message key="button.relatorio" />
					</a> 
				</p>
			</div>
		</div>
	</div>
	<div class="col-md-4 col-sm-6 hero-feature">
		<div class="thumbnail">
			<div class="caption">
				<h4><fmt:message key="relatorio.turma" /></h4>
				<p><fmt:message key="relatorio.msg.turma" /></p>
				<p>
					<a href="<c:url value="/relatorios/turmas"></c:url>" class="btn btn-primary">
						<fmt:message key="button.relatorio" />
					</a>
				</p>
			</div>
		</div>
	</div>
	<div class="col-md-4 col-sm-6 hero-feature">
		<div class="thumbnail">
			<div class="caption">
				<h4><fmt:message key="relatorio.professor" /></h4>
				<p><fmt:message key="relatorio.msg.professor" /></p>
				<p>
					<a href="<c:url value="/relatorios/professores"></c:url>" class="btn btn-primary">
						<fmt:message key="button.relatorio" />
					</a>
				</p>
			</div>
		</div>
	</div>
</div>
