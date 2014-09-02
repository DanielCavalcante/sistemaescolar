<!DOCTYPE html>
<html lang="pt-br">
	<head>
		<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
		<meta charset="UTF-8">
		<title>Sistema Escolar</title>
		
<style>
		body {
  padding-top: 40px;
  padding-bottom: 40px;
  background-color: #eee;
}

.form-signin {
  max-width: 330px;
  padding: 15px;
  margin: 0 auto;
}
.form-signin .form-signin-heading,
.form-signin .checkbox {
  margin-bottom: 10px;
}
.form-signin .checkbox {
  font-weight: normal;
}
.form-signin .form-control {
  position: relative;
  height: auto;
  -webkit-box-sizing: border-box;
     -moz-box-sizing: border-box;
          box-sizing: border-box;
  padding: 10px;
  font-size: 16px;
}
.form-signin .form-control:focus {
  z-index: 2;
}
.form-signin input[type="email"] {
  margin-bottom: -1px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
}
.form-signin input[type="password"] {
  margin-bottom: 10px;
  border-top-left-radius: 0;
  border-top-right-radius: 0;
}
</style>
	</head>
	<body>
		<div class="container">
			<form class="form-signin" role="form" action="<c:url value='/autenticar' />" method="post">
				<h2 class="form-signin-heading">Please sign in</h2>
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
