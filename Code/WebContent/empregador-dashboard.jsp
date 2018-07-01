<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/validarUsuario.jsp"%>
<%@page language="java" import="database.ConectaBD"%>
<%@page language="java" import="java.sql.*"%>
<%
	String email = null;
	String isDomestica = null;
	String nome = null;
	String idPessoa = null;
	
	email = request.getSession().getAttribute("user").toString();
	isDomestica = request.getSession().getAttribute("isDomestica").toString();
	Connection conGetNome = ConectaBD.getConnection();
	String queryGetNome = "select nome, idpessoa FROM pessoa where email=" + "'" + email + "'";
	PreparedStatement stmtGetNome = conGetNome.prepareStatement(queryGetNome);
	ResultSet rsGetNome = stmtGetNome.executeQuery(queryGetNome);
	while (rsGetNome.next()) {
		nome = rsGetNome.getString(1);
		idPessoa = rsGetNome.getString(2);
	}
	conGetNome.close();

	if (isDomestica.equals("true")) {
		response.sendRedirect("diarista-dashboard.jsp");
	}
%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Empregador Dashboard</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/search.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>

</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-light bg-light"> <a
		class="navbar-brand" href="empregador-dashboard.jsp">Limpai!</a>
		<li class="nav-link"><a class=nav-link href="search.jsp">Buscar diaristas!</a></li>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
		</ul>
		<ul1 class="navbar-nav my-sm-0">
		<li class="nav-link"><a class="nav-link" href="logout.jsp">Sair<span
				class="sr-only">(current)</span></a></li>
	</div>
	</nav>

	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<h1>
					Olá
					<%
					out.print(nome);
				%>!
				</h1>
			</div>
		</div>
		<div class="row">
			<br>		
		</div>
	</div>


	<div class="container">
		<div class="row">


			<div class="col-md-12">
				<h4>Diarista contratada</h4>
				<div class="table-responsive">
<!-- 			AJUSTAR PARA RETORNAR A DIARISTA CONTRATADA -->

					<table id="mytable" class="table table-bordred table-striped">

						<thead>

							<th>Nome</th>
							<th>Data</th>
							<th>Período</th>
							<th>Contato</th>
							<th>Valor</th>

						</thead>
						<tbody>


		<%
			try {
				Connection con = ConectaBD.getConnection();

				String query = "select p.nome, a.data, a.hora_inicio, a.hora_fim, p.telefone, d.val_diaria from pessoa p, contratacao c, agenda a, domestico d where c.domestico_pessoa_idpessoa=p.idpessoa AND c.domestico_pessoa_idpessoa=a.domestico_pessoa_idpessoa AND c.domestico_pessoa_idpessoa=d.pessoa_idpessoa AND c.empregador_pessoa_idpessoa=" +"'"+ idPessoa +"'";

				PreparedStatement stmt = con.prepareStatement(query);
				ResultSet rs = stmt.executeQuery(query);
				while (rs.next()) {
		%>

		<tr>
			<td id="tabelaResultado">
				<%
					out.println(rs.getString(1));
				%>
			</td>
			<td>
				<%
					out.println(rs.getString(2));
				%>
			</td>
			
			<td>
				<%
					out.println(rs.getString(3)+ " as ");
					out.println(rs.getString(4));
				%>
			</td>
			
			<td>
				<%
					out.println(rs.getString(5));
				%>
			</td>

			
			<td>
				<%
					out.println(rs.getString(6));
				%>
			</td>
		</tr>

		<%
			}

		%>

						</tbody>
					</table>
					
					
<%


		con.close();

	} catch (Exception e) {
		out.println(e.toString());

	}
%>	
				</div>			
			</div>
		</div>
	</div>