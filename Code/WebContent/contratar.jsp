<%@page import="com.sun.javafx.beans.IDProperty"%>
<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page language="java" import="database.ConectaBD"%>
<%@page language="java" import="java.sql.*"%>
<%@include file="/validarUsuario.jsp"%>

<%
String segunda = request.getParameter("segunda");
String terca = request.getParameter("terca");
String quarta = request.getParameter("quarta");
String quinta = request.getParameter("quinta");
String sexta = request.getParameter("sexta");

String descricao  = "descricao servico";
String idEmpregador = "1";
String idDomestico = "1";

try {
	
	// Contratação
	//	INSERT INTO `mysqlpor_limpai_db`.`contratacao`(`idcontratacao`,`descricao_servico`,`empregador_idempregador`,
			//`empregador_pessoa_idpessoa`,`domestico_iddomestico`,`domestico_pessoa_idpessoa`,`status`)
			//VALUES(<{idcontratacao: }>,<{descricao_servico: }>,<{empregador_idempregador: }>,<{empregador_pessoa_idpessoa: }>,
			//<{domestico_iddomestico: }>,<{domestico_pessoa_idpessoa: }>,<{status: }>);


	Connection conContratar = ConectaBD.getConnection();	
	String queryContratacao = "insert into contratacao values (?, ?, ?, ?, ?, ?, ?)";
	PreparedStatement stmtContratacao = conContratacao.prepareStatement(queryContratacao);
	stmtContratacao.setString(1, null);
	stmtContratacao.setString(2, descricao);
	stmtContratacao.setString(3, idEmpregador);
	stmtContratacao.setString(4, null);
	stmtContratacao.setString(5, idDomestico);
	stmtContratacao.setString(6, null);
	stmtContratacao.setString(7, null);
	stmtContratacao.execute();
	stmtContratacao.close();
	conContratacao.close();

%>
