<form action="<c:url value='/turmas/save' />" method="post" class="form-horizontal">
	<input type="hidden" value="${turma.id}" name="turma.id" />
	<div class="row">
		<div class="form-inline">
			<div class="col-lg-3">
				<a href="<c:url value='/turmas'/>" class="btn btn-default"><span class="glyphicon glyphicon-arrow-left"></span> <fmt:message key="button.back" /></a>
				<button type="submit" class="btn btn-success">
					<span class="glyphicon glyphicon-ok"></span> <fmt:message key="button.save" />
				</button>
			</div>
		</div>
	</div>	
	<jsp:include page="turmas.jsp"></jsp:include>
</form>
<js:import javascript="/js/turma.js"></js:import>
