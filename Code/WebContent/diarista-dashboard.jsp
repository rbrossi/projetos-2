<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/validarUsuario.jsp"%>
<%@page language="java" import="database.ConectaBD"%>
<%@page language="java" import="java.sql.*"%>

<%
String nome = null;
String email = request.getSession().getAttribute("user").toString();
Connection conGetNome = ConectaBD.getConnection();
String queryGetNome = "select nome FROM pessoa where email=" + "'" + email + "'";
PreparedStatement stmtGetNome = conGetNome.prepareStatement(queryGetNome);
ResultSet rsGetNome = stmtGetNome.executeQuery(queryGetNome);
while (rsGetNome.next()) {
	nome = rsGetNome.getString(1);
}
conGetNome.close();


%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Dashboard</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/search.css">
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-light bg-light"> <a
		class="navbar-brand" href="diarista-dashboard.jsp">Limpai!</a>
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
      		<li class="nav-link">
        		<a class="nav-link" href="logout.jsp">Sair<span class="sr-only">(current)</span></a>
      		</li>    		
	</div>
	</nav>

	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<h1>Olá <%out.print(nome);%>!</h1>
			</div>
		</div>
	</div>

	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>

	<div class="container">
		<div class="row">


			<div class="col-md-12">
				<h4>
					<script language=javascript type="text/javascript">
						dayName = new Array("domingo", "segunda", "terça",
								"quarta", "quinta", "sexta", "sábado")
						monName = new Array("janeiro", "fevereiro", "março",
								"abril", "maio", "junho", "agosto", "outubro",
								"novembro", "dezembro")
						now = new Date
					</script>
					</head>
					<body>
						<script language=javascript type="text/javascript">
							document.write("Hoje é "
									+ dayName[now.getDay()] + ", "
									+ now.getDate() + " de "
									+ monName[now.getMonth()] + " de "
									+ now.getFullYear() + ".")
						</script>
				</h4>
				<div class="table-responsive">


					<table id="mytable" class="table table-bordred table-striped">

						<thead>
							
							<th>Cliente</th>
							<th>Telefone</th>
							<th>Endereco</th>
							<th>Data</th>
							<th>Hora</th>

						</thead>
						<tbody>

							<tr>
								<td>Julio</td>
								<td>(47) 3385-1880</td>
								<td>Av. Nereu Ramos, 100</td>
								<td>Quarta-feira</td>
								<td>08:00 - 10:00</td>
							</tr>

						
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>