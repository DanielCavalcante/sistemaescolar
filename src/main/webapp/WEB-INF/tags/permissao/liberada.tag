<%@tag import="com.model.UsuarioSessao"%>
<%@attribute name="permissoes" type="java.lang.String" %>
<%
UsuarioSessao u = (UsuarioSessao) session.getAttribute("usuarioSessao");
if (u.temPermissao(permissoes)) { %>
	<jsp:doBody />
<% } %>
