<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page language="java" import="database.ConectaBD"%>
<%@page language="java" import="java.sql.*"%>
<%
	String email = request.getParameter("email");
	String senha = request.getParameter("senha");

	String emaile = null;
	String senhae = null;
	try {
		Connection con = ConectaBD.getConnection();
		String query = "select email, senha from usuarios";
		PreparedStatement stmt = con.prepareStatement(query);

		ResultSet rs = stmt.executeQuery(query);

		while (rs.next()) {
			emaile = rs.getString(1); //mostra o campo 2 da tabela
			senhae = rs.getString(2);//mostra o campo 3 da tabela

			if (emaile.equals(email) && senhae.equals(senha)) {
				response.sendRedirect("home.jsp");
				con.close();
			}
		}
		response.sendRedirect("login.jsp?erro=1");
	
		
		

		//fecha a conexao com o banco
		con.close();
	} catch (Exception e) {
		out.println(e.toString());
	}
%>