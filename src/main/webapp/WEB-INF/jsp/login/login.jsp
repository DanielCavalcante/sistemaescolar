<!DOCTYPE html>
<html lang="pt-br">
	<head>
		<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
		<link href="${context}/css/login.css" rel="stylesheet">
		<meta charset="UTF-8">
		<title><fmt:message key="sistema.title" /></title>
	</head>
	<body>
		<div class="container">
			<form class="form-signin" role="form" action="<c:url value='/autenticar' />" method="post">
				<h3 class="form-signin-heading"><fmt:message key="msg.login" /></h3>
				<input type="text" name="usuario.login" class="form-control" placeholder="<fmt:message key="usuario.login" />" required autofocus/>
				<input type="password" name="usuario.senha" class="form-control" placeholder="<fmt:message key="usuario.senha" />" required autofocus/>
				<button type="submit" class="btn btn-lg btn-primary btn-block"><fmt:message key="button.entrar" /></button>
			</form>
		</div>
		<script src="//ajax.googleapis.com/ajax/libs/angularjs/1.2.12/angular.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	</body>
</html>		
