<%@page import="com.sun.javafx.beans.IDProperty"%>
<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page language="java" import="database.ConectaBD"%>
<%@page language="java" import="java.sql.*"%>
<%@include file="/validarUsuario.jsp"%>

<%
	String data = request.getParameter("dataServico");
	String hora_inicio = request.getParameter("hInicio");
	String hora_fim = request.getParameter("hFinal");


	
	
	// Contrata��o
	String descricao_servico = "teste de insert";
	String empregador_idempregador = "14";
	String empregador_pessoa_idpessoa = "24";
	String domestico_iddomestico = "10";
	String domestico_pessoa_idpessoa = "27";
	String status = "0";


	try {

		// Contrata��o
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


