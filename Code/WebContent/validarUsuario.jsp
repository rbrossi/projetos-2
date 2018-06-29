<%
String userLogado = null;
if ((session.getAttribute("user") != null)||(session.getAttribute("isDomestica") != null)){
	userLogado = (String) session.getAttribute("user");
} else {
	response.sendRedirect("login.jsp");
}
%>