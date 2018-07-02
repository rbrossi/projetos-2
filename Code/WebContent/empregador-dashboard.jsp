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
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
	integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
	crossorigin="anonymous"></script>
	
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
							<th>Situação</th>
							<th></th>

						</thead>
						<tbody>


		<%
			try {
				Connection con = ConectaBD.getConnection();

				String query = "select p.nome, DATE_FORMAT(a.data, '%d/%m/%Y'), TIME_FORMAT(a.hora_inicio, '%h:%i'), TIME_FORMAT(a.hora_fim, '%h:%i'), p.telefone, d.val_diaria, c.status from pessoa p, contratacao c, agenda a, domestico d where c.domestico_pessoa_idpessoa=p.idpessoa AND c.domestico_pessoa_idpessoa=a.domestico_pessoa_idpessoa AND c.domestico_pessoa_idpessoa=d.pessoa_idpessoa AND c.empregador_pessoa_idpessoa=" +"'"+ idPessoa +"'" +" order by c.status";

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
			
			<td>
				<%
		        switch (Integer.parseInt(rs.getString(7))) {
	            case 0:
	            	out.println("Execução Pendente");
	                break;
	            case 1:
	            	out.println("Avaliação Pendente");
	                break;
	            case 2:
	            	out.println("Concluido");
	                break;
	            case 3:
	            	out.println("Cancelado pela diarista");
	                break;
	            case 4:
	            	out.println("Cancelado pelo empregador");
	                break;
	         }
							
				%>
			</td>
		<td>
				<!-- Button trigger modal -->
				<button type="button" class=" btn-primary btn-center"
					data-toggle="modal" data-target="#exampleModal">Avaliar</button> <!-- Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Avaliar</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<form method="post" action="avaliar.jsp">
								<div class="modal-body">
									Como você avalia o serviço prestado?
									<div class="form-check">
										<input class="form-check-input" type="checkbox" name="Ruim">
										<label class="form-check-label"> Ruim </label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="checkbox" name="Regular">
										<label class="form-check-label"> Regular </label>
									</div>
																		<div class="form-check">
										<input class="form-check-input" type="checkbox" name="Bom">
										<label class="form-check-label"> Bom </label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="checkbox" name="Muito bom">
										<label class="form-check-label"> Muito bom </label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="checkbox" name="Exelente">
										<label class="form-check-label"> Exelente </label>
									</div>
								</div>
								<div class="modal-footer">
									<button type="submit">Avaliar</button>
								</div>
							</form>
						</div>
					</div>
				</div>

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