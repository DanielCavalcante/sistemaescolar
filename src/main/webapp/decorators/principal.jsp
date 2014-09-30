<!DOCTYPE html>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<html lang="pt-br">
	<head>
		<meta charset="UTF-8">
		<script type="text/javascript"> URL = '${context}';</script>
		<link href="${context}/css/bootstrap.min.css" rel="stylesheet">
		<link href="${context}/css/bootstrap-theme.min.css" rel="stylesheet">
		<link href="${context}/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
		<link href="${context}/css/style.css" rel="stylesheet">
		<title><fmt:message key="sistema.title" /></title>
		<decorator:head/>
	</head>
	<body>
		<div class="container">
			<div id="menu">
				<jsp:include page="menu.jsp"></jsp:include>
			</div>
			<div id="conteudo" class="conteudo">
				<msg:messages />
				<decorator:body/>
			</div>
			<script src="${context}/js/angular.min.js"></script>
			<script src="${context}/js/jQuery.js"></script>
			<script src="${context}/js/bootstrap.min.js"></script>
			<script src="${context}/js/moment.js"></script>
			<script src="${context}/js/bootstrap-datetimepicker.pt-BR.js"></script>
			<script src="${context}/js/bootstrap-datetimepicker.min.js"></script>
			<script src="${context}/js/app.js"></script>
			<c:forEach items="${jsImports}" var="js">
				<script type="text/javascript" src="${context}${js}"></script>
			</c:forEach>
		</div>
	</body>
</html>