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
String cidade = request.getParameter("cidade");
String endereco = request.getParameter("endereco");
String telefone = request.getParameter("telefone");
String servico = request.getParameter("null");
String valor = request.getParameter("null");
String isEmpregador = "true";	
try {
	
	Connection con = ConectaBD.getConnection();
	String query = "insert into usuarios values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";		
	PreparedStatement stmt = con.prepareStatement(query);
	stmt.setString(1, null);
	stmt.setString(2, nome);
	stmt.setString(3, email);
	stmt.setString(4, senha);
	stmt.setString(5, cpf);
	stmt.setString(6, dataNascimento);
	stmt.setString(7, cidade);
	stmt.setString(8, endereco);
	stmt.setString(9, telefone);
	stmt.setString(10, servico);
	stmt.setString(11, valor);
	stmt.setString(12	, isEmpregador);
	stmt.execute();
	stmt.close();
	con.close();

} catch (Exception e) {
	out.print(e);
}

response.sendRedirect("index.jsp");
%>
