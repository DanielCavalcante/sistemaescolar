<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<a class="navbar-brand" href="${context}/index"><fmt:message key="sistema.title" /></a>
		<ul class="nav navbar-nav">
			<li><a href="${context}/escola"><fmt:message key="menu.escola" /></a></li>
			<li><a href="${context}/alunos"><fmt:message key="menu.alunos" /></a></li>
			<li><a href="${context}/turmas"><fmt:message key="menu.turmas" /></a></li>
			<li><a href="${context}/professores"><fmt:message key="menu.professores" /></a></li>
			<li><a href="${context}/usuarios"><fmt:message key="menu.usuarios" /></a></li>
			<li><a href="${context}/perfis"><fmt:message key="menu.perfis" /></a></li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="${context}/usuarios/meusDados"><span class="glyphicon glyphicon-user"></span></a></li>
			<li><a href="${context}/logout"><span class="glyphicon glyphicon-log-out"></span></a></li>
		</ul>
	</div>
</nav>
