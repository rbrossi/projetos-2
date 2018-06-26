<%@page import="org.apache.el.lang.ELSupport"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page language="java" import="database.ConectaBD"%>
<%@page language="java" import="java.sql.*"%>
<%
	String email = request.getParameter("email");
	String senha = request.getParameter("senha");
	int idDomestico = 0;
	int idPessoa = 0;
	boolean isDomestica = false;
	String emaile = null;
	String senhae = null;

	try {

		Connection conGetIDPessoa = ConectaBD.getConnection();
		String queryGetIDPessoa = "select idpessoa FROM pessoa where email=" + "'" + email + "'";
		PreparedStatement stmtGetIDPessoa = conGetIDPessoa.prepareStatement(queryGetIDPessoa);
		ResultSet rsGetIDPessoa = stmtGetIDPessoa.executeQuery(queryGetIDPessoa);
		while (rsGetIDPessoa.next()) {
			idPessoa = Integer.parseInt(rsGetIDPessoa.getString(1));
		}
		conGetIDPessoa.close();

		Connection conGetIDDomestico = ConectaBD.getConnection();
		String queryGetIDDomestico = "select iddomestico FROM domestico where pessoa_idpessoa=" + "'" + idPessoa
				+ "'";
		PreparedStatement stmtGetIDDomestico = conGetIDDomestico.prepareStatement(queryGetIDDomestico);
		ResultSet rsGetIDDomestico = stmtGetIDDomestico.executeQuery(queryGetIDDomestico);
		while (rsGetIDDomestico.next()) {
			idDomestico = Integer.parseInt(rsGetIDDomestico.getString(1));
		}
		conGetIDPessoa.close();

		if (idDomestico > 0) {

			isDomestica = true;

		} else {

			isDomestica = false;

		}

	} catch (Exception e) {
		out.println(e.toString());
	}

	try {

		Connection conGetSenha = ConectaBD.getConnection();
		String queryGetSenha = "select email, senha FROM pessoa where email=" + "'" + email + "'";
		PreparedStatement stmtGetSenha = conGetSenha.prepareStatement(queryGetSenha);
		ResultSet rsGetSenha = stmtGetSenha.executeQuery(queryGetSenha);
		while (rsGetSenha.next()) {
			emaile = rsGetSenha.getString(1); //mostra o campo 2 da tabela
			senhae = rsGetSenha.getString(2);//mostra o campo 3 da tabela
		}
		conGetSenha.close();

		if (email.equals(emaile) && senha.equals(senhae)) {
			if (isDomestica) {
				session.setAttribute("user", email); //controle de sessão
				session.setAttribute("isDomestica", isDomestica);
				response.sendRedirect("diarista-dashboard.jsp");
			} else {
				session.setAttribute("user", email); //controle de sessão
				session.setAttribute("isDomestica", isDomestica);
				response.sendRedirect("empregador-dashboard.jsp");

				// 				System.out.print(session.getAttribute("user"));
			}

		} else
			response.sendRedirect("login.jsp?erro=1");

	} catch (Exception e) {
		out.println(e.toString());
	}
%>