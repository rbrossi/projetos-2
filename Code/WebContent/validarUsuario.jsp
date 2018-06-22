<%
String userLogado = null;
if (session.getAttribute("user") != null){
	userLogado = (String) session.getAttribute("user");
} else {
	response.sendRedirect("login.jsp");
}
%>