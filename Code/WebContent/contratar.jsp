<%@page import="com.sun.javafx.beans.IDProperty"%>
<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page language="java" import="database.ConectaBD"%>
<%@page language="java" import="java.sql.*"%>
<%@include file="/validarUsuario.jsp"%>

<%
	String email = request.getSession().getAttribute("user").toString();

	String data = request.getParameter("dataServico");
	String hora_inicio = request.getParameter("hInicio");
	String hora_fim = request.getParameter("hFinal");
	String nome_diarista = request.getParameter("diarista-nome");

	// Contratação
	String descricao_servico = "VAI PORRAAAA";
	String empregador_idempregador = "";
	String empregador_pessoa_idpessoa = "";
	String domestico_iddomestico = "";
	String domestico_pessoa_idpessoa = "";
	String status = "0";

	try {

		//capturar dados
		//ID DOMESTICO
		Connection conGetIdDomestico = ConectaBD.getConnection();
		String queryGetIdDomestico = "select d.iddomestico from domestico d, pessoa p where p.idpessoa=d.pessoa_idpessoa and p.nome="
				+ "'" + nome_diarista + "'";
		PreparedStatement stmtGetIDDomestico = conGetIdDomestico.prepareStatement(queryGetIdDomestico);
		ResultSet rsGetIDDomestico = stmtGetIDDomestico.executeQuery(queryGetIdDomestico);
		while (rsGetIDDomestico.next()) {
			domestico_iddomestico = rsGetIDDomestico.getString(1);
		}

		conGetIdDomestico.close();

		//ID PESSOA DOMESTICO

		Connection conGetIdDomesticoPessoa = ConectaBD.getConnection();
		String queryGetIdDomesticoPessoa = "select d.pessoa_idpessoa from domestico d, pessoa p where p.idpessoa=d.pessoa_idpessoa and p.nome="
				+ "'" + nome_diarista + "'";
		PreparedStatement stmtGetIDDomesticoPessoa = conGetIdDomesticoPessoa
				.prepareStatement(queryGetIdDomesticoPessoa);
		ResultSet rsGetIDDomesticoPessoa = stmtGetIDDomesticoPessoa.executeQuery(queryGetIdDomesticoPessoa);
		while (rsGetIDDomesticoPessoa.next()) {
			domestico_pessoa_idpessoa = rsGetIDDomesticoPessoa.getString(1);
		}

		conGetIdDomesticoPessoa.close();

		//ID EMPREGADOR		 

		Connection conGetIdEmpregador = ConectaBD.getConnection();
		String queryGetIdEmpregador = "select e.idempregador from pessoa p, empregador e where e.pessoa_idpessoa=p.idpessoa and p.email="
				+ "'" + email + "'";
		PreparedStatement stmtGetIDEmpregador = conGetIdEmpregador.prepareStatement(queryGetIdEmpregador);
		ResultSet rsGetIDEmpregador = stmtGetIDEmpregador.executeQuery(queryGetIdEmpregador);
		while (rsGetIDEmpregador.next()) {
			empregador_idempregador = rsGetIDEmpregador.getString(1);
		}
		conGetIdEmpregador.close();

		//ID PESSOA EMPREGADOR		

		Connection conGetIdEmpregadorPessoa = ConectaBD.getConnection();
		String queryGetIdEmpregadorPessoa = "select e.pessoa_idpessoa from pessoa p, empregador e where e.pessoa_idpessoa=p.idpessoa and p.email ="
				+ "'" + email + "'";
		PreparedStatement stmtGetIDEmpregadorPessoa = conGetIdEmpregadorPessoa
				.prepareStatement(queryGetIdEmpregadorPessoa);
		ResultSet rsGetIDEmpregadorPessoa = stmtGetIDEmpregadorPessoa.executeQuery(queryGetIdEmpregadorPessoa);
		while (rsGetIDEmpregadorPessoa.next()) {
			empregador_pessoa_idpessoa = rsGetIDEmpregadorPessoa.getString(1);
		}
		conGetIdEmpregadorPessoa.close();

		// Contratação
		//	INSERT INTO `mysqlpor_limpai_db`.`contratacao`(`idcontratacao`,`descricao_servico`,`empregador_idempregador`,
		//`empregador_pessoa_idpessoa`,`domestico_iddomestico`,`domestico_pessoa_idpessoa`,`status`)
		//VALUES(<{idcontratacao: }>,<{descricao_servico: }>,<{empregador_idempregador: }>,<{empregador_pessoa_idpessoa: }>,
		//<{domestico_iddomestico: }>,<{domestico_pessoa_idpessoa: }>,<{status: }>);

		Connection conContratar = ConectaBD.getConnection();
		String queryContratar = "insert into contratacao values (?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement stmtContratar = conContratar.prepareStatement(queryContratar);
		stmtContratar.setString(1, null);
		stmtContratar.setString(2, descricao_servico);
		stmtContratar.setString(3, empregador_idempregador);
		stmtContratar.setString(4, empregador_pessoa_idpessoa);
		stmtContratar.setString(5, domestico_iddomestico);
		stmtContratar.setString(6, domestico_pessoa_idpessoa);
		stmtContratar.setString(7, status);
		stmtContratar.execute();
		stmtContratar.close();
		conContratar.close();

		//Agenda
		//INSERT INTO `mysqlpor_limpai_db`.`agenda` (`data`, `hora_inicio`, `hora_fim`, `domestico_iddomestico`, `domestico_pessoa_idpessoa`) VALUES ('2018-05-29', '10:00', '15:00', '10', '27');

		Connection conAgenda = ConectaBD.getConnection();
		String queryAgenda = "insert into agenda values (?, ?, ?, ?, ?, ?)";
		PreparedStatement stmtAgenda = conAgenda.prepareStatement(queryAgenda);
		stmtAgenda.setString(1, null);
		stmtAgenda.setString(2, data);
		stmtAgenda.setString(3, hora_inicio);
		stmtAgenda.setString(4, hora_fim);
		stmtAgenda.setString(5, domestico_iddomestico);
		stmtAgenda.setString(6, domestico_pessoa_idpessoa);
		stmtAgenda.execute();
		stmtAgenda.close();
		conAgenda.close();

	} catch (Exception e) {
		out.print(e);
	}
	response.sendRedirect("buscar-banco.jsp");
%>


