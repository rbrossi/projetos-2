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
	Float valor = Float.parseFloat(request.getParameter("valor"));	
	String estado = request.getParameter("estado");
	String cidade = request.getParameter("cidade");
	String bairro = request.getParameter("bairro");
	String rua = request.getParameter("rua");
	int numero = Integer.parseInt(request.getParameter("numero"));
	String complemento = request.getParameter("complemento");
	String servico = request.getParameter("servico");
	int idPessoa = 0 ;
	int idDomestico = 0;
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
		ResultSet rsGetIDPessoa = stmtGetIDPessoa.executeQuery(queryGetIDPessoa);
		while (rsGetIDPessoa.next()) {
			idPessoa = Integer.parseInt(rsGetIDPessoa.getString(1)) ;	
		}

		conGetIDPessoa.close();


		Connection conDomestico = ConectaBD.getConnection();	
		String queryDomestico = "insert into domestico values (?, ?, ?)";
		PreparedStatement stmtDomestico = conDomestico.prepareStatement(queryDomestico);
		stmtDomestico.setString(1, null);
		stmtDomestico.setFloat(2, valor);
		stmtDomestico.setInt(3, idPessoa);
		stmtDomestico.execute();
		stmtDomestico.close();
		conDomestico.close();
		
		//Logradouro
		//  INSERT INTO `mysqlpor_limpai_db`.`logradouro` (`estado`, `cidade`, `bairro`, `rua`, `numero`, `complemento`, `pessoa_idpessoa`) VALUES ('sc', 'pomerode', 'centro', 'teste', '145', 'casa', (SELECT idpessoa FROM mysqlpor_limpai_db.pessoa where email="douglas-portuga@hotmail.com"));
		
		Connection conLogradouro = ConectaBD.getConnection();	
		String queryLogradouro = "insert into logradouro values (?, ?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement stmtLogradouro = conLogradouro.prepareStatement(queryLogradouro);
		stmtLogradouro.setString(1, null);
		stmtLogradouro.setString(2, estado);
		stmtLogradouro.setString(3, cidade);
		stmtLogradouro.setString(4, bairro);
		stmtLogradouro.setString(5, rua);
		stmtLogradouro.setInt(6, numero);
		stmtLogradouro.setString(7, complemento);
		stmtLogradouro.setInt(8, idPessoa);
		stmtLogradouro.execute();
		stmtLogradouro.close();
		conLogradouro.close();
		
	
		//INSERT INTO `mysqlpor_limpai_db`.`servicos` (`servico`, `descricao`, `domestico_iddomestico`, `domestico_pessoa_idpessoa`) VALUES ('teste', 'teste', '11', '10');
		
		Connection conGetIDDomestico = ConectaBD.getConnection();
		String queryGetIDDomestico = "select iddomestico FROM domestico where pessoa_idpessoa=" +"'" + idPessoa + "'";
		PreparedStatement stmtGetIDDomestico = conGetIDDomestico.prepareStatement(queryGetIDDomestico);
		ResultSet rsGetIDDomestico  = stmtGetIDDomestico.executeQuery(queryGetIDDomestico);
		while (rsGetIDDomestico .next()) {
			idDomestico = Integer.parseInt(rsGetIDDomestico .getString(1));	
		}

		conGetIDPessoa.close();


		Connection conServico = ConectaBD.getConnection();	
		String queryServico = "insert into servicos values (?, ?, ?, ?, ?)";
		PreparedStatement stmtServico = conServico.prepareStatement(queryServico);
		stmtServico.setString(1, null);
		stmtServico.setString(2, servico);
		stmtServico.setString(3, servico);
		stmtServico.setInt(4, idDomestico);
		stmtServico.setInt(5, idPessoa);
		stmtServico.execute();
		stmtServico.close();
		conServico.close();

		

	} catch (Exception e) {
		out.print(e);
	}

	response.sendRedirect("index.jsp");
%>
