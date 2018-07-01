<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/validarUsuario.jsp"%>
<%@page language="java" import="database.ConectaBD"%>
<%@page language="java" import="java.sql.*"%>

<%
String nome = null;
String idPessoa = null;
String email = request.getSession().getAttribute("user").toString();
String isDomestica = request.getSession().getAttribute("isDomestica").toString();


Connection conGetNome = ConectaBD.getConnection();
String queryGetNome = "select nome, idPessoa FROM pessoa where email=" + "'" + email + "'";
PreparedStatement stmtGetNome = conGetNome.prepareStatement(queryGetNome);
ResultSet rsGetNome = stmtGetNome.executeQuery(queryGetNome);
while (rsGetNome.next()) {
	nome = rsGetNome.getString(1);
	idPessoa = rsGetNome.getString(2);
}
conGetNome.close();

if (isDomestica.equals("false")){
	response.sendRedirect("empregador-dashboard.jsp");
}


//select empregador_pessoa_idpessoa from contratacao where domestico_iddomestico = 10




%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Dashboard</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/search.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>

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
				<h1>Ol� <%out.print(nome);%>!</h1>
			</div>
		</div>
	</div>



	<div class="container">
		<div class="row">


			<div class="col-md-12">
				<h4>
					<script language=javascript type="text/javascript">
						dayName = new Array("domingo", "segunda", "ter�a",
								"quarta", "quinta", "sexta", "s�bado")
						monName = new Array("janeiro", "fevereiro", "mar�o",
								"abril", "maio", "junho", "agosto", "outubro",
								"novembro", "dezembro")
						now = new Date
					</script>
					</head>
					<body>
						<script language=javascript type="text/javascript">
							document.write("Hoje � "
									+ dayName[now.getDay()] + ", "
									+ now.getDate() + " de "
									+ monName[now.getMonth()] + " de "
									+ now.getFullYear() + ".")
						</script>
				</h4>
				<div class="table-responsive">


					<table class="table table-striped table-bordered">
		<thead>
			<tr>
				<th>Nome</th>
				<th>Cidade</th>
				<th>Telefone</th>
				<th>Descri��o do servi�o</th>
				<th>Status</th>
			</tr>
		</thead>

		<%
			try {
				Connection con = ConectaBD.getConnection();

				String query = "select p.nome, l.cidade, p.telefone, s.descricao, d.val_diaria, p.idpessoa, d.iddomestico from pessoa  p, domestico d, logradouro l, servicos s where p.idpessoa=d.pessoa_idpessoa and p.idpessoa=l.pessoa_idpessoa and p.idpessoa=s.domestico_pessoa_idpessoa and l.cidade="
						+ "'" + "blumenau" + "' ";

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
					out.println(rs.getString(3));
				%>
			</td>
			<td>
				<%
					out.println(rs.getString(4));
				%>
			</td>
			<td>
				<%
					out.println(rs.getString(5));
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
	</body>