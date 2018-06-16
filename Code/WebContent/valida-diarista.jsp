<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page language="java" import="database.ConectaBD"%>
<%@page language="java" import="java.sql.*"%>

<%
	String nome = request.getParameter("nome");
	String email = request.getParameter("email");
	String senha = request.getParameter("senha");
	String cpf = request.getParameter("cpf");
	String dataNascimento = request.getParameter("dataNascimento");
	String telefone = request.getParameter("telefone");
	String cidade = request.getParameter("cidade");
	String endereco = request.getParameter("endereco");
	Float valor = Float.parseFloat(request.getParameter("valor"));	
	String servico = request.getParameter("servico");
	String idPessoa = "null";
	try {
		
		// Pessoa
		//	INSERT INTO `mysqlpor_limpai_db`.`pessoa` (`nome`, `email`, `senha`, `cpf`, `nascimento`, `telefone`) VALUES ('Rafael', 'rafael-rossi@hotmail.com', '123', '09851829978', '02/07/1995', '47 988729216');

		Connection conPessoa = ConectaBD.getConnection();	
		String queryPessoa = "insert into pessoa values (?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement stmtPessoa = conPessoa.prepareStatement(queryPessoa);
		stmtPessoa.setString(1, null);
		stmtPessoa.setString(2, nome);
		stmtPessoa.setString(3, email);
		stmtPessoa.setString(4, senha);
		stmtPessoa.setString(5, cpf);
		stmtPessoa.setString(6, dataNascimento);
		stmtPessoa.setString(7, telefone);
		stmtPessoa.execute();
		stmtPessoa.close();
		conPessoa.close();

		//Domestico
		//	INSERT INTO `mysqlpor_limpai_db`.`domestico` (`val_diaria`, `pessoa_idpessoa`) VALUES ('100', '2');
		
		Connection conGetIDPessoa = ConectaBD.getConnection();
		String queryGetIDPessoa = "select idpessoa FROM pessoa where email=" +"'" + email + "'";
		PreparedStatement stmtGetIDPessoa = conGetIDPessoa.prepareStatement(queryGetIDPessoa);
		ResultSet rs = stmtGetIDPessoa.executeQuery(queryGetIDPessoa);
		while (rs.next()) {
			idPessoa = rs.getString(1);	
		}

		conGetIDPessoa.close();


		Connection conDomestico = ConectaBD.getConnection();	
		String queryDomestico = "insert into domestico values (?, ?, ?)";
		PreparedStatement stmtDomestico = conDomestico.prepareStatement(queryDomestico);
		stmtDomestico.setString(1, null);
		stmtDomestico.setFloat(2, valor);
		stmtDomestico.setString(3, idPessoa);
		stmtDomestico.execute();
		stmtDomestico.close();
		conDomestico.close();
		

	} catch (Exception e) {
		out.print(e);
	}

	response.sendRedirect("index.jsp");
%>
