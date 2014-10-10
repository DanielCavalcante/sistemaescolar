<link href="${context}/css/bootstrap.min.css" rel="stylesheet" >
<style>
body {
	margin: 0.5cm;
}
</style>
<div class="container row">
	<h3 class="text-center"><fmt:message key="relatorio.da.turma" /> ${turma.nome}</h3>
	<table class="table table-condensed">
		<thead>
			<tr>
				<th><fmt:message key="aluno.nome" /></th>
				<th><fmt:message key="aluno.data.nascimento" /></th>
				<th><fmt:message key="aluno.filiacao.mae" /></th>
				<th><fmt:message key="aluno.filiacao.pai" /></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${alunoList}" var="a">
				<tr>
					<td>${a.nome}</td>
					<td><fmt:formatDate value="${a.dataNascimento}" pattern="dd/MM/yyyy"/></td>
					<td>${a.filiacaoMae}</td>
					<td>${a.filiacaoPai}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="text-center">
		<h5><fmt:message key="relatorio.qtde.alunos" /> ${qtdeAlunos}</h5>
	</div>
</div>