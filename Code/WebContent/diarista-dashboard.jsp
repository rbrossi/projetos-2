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
				<h1>Olá <%out.print(nome);%>!</h1>
			</div>
		</div>
	</div>



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


					<table class="table table-striped table-bordered">
		<thead>
			<tr>
				<th>Nome</th>
				<th>Telefone</th>
				<th>Endereço</th>
				<th>Descrição do serviço</th>
				<th>Data</th>
				<th>Horário</th>	
				<th>Status</th>
			</tr>
		</thead>

		<%
			try {
				Connection con = ConectaBD.getConnection();

				String query = "select p.nome, p.telefone, l.rua, l.bairro, l.numero, l.complemento, l.estado, c.descricao_servico, DATE_FORMAT(a.data, '%d/%m/%Y'), TIME_FORMAT(a.hora_inicio, '%h:%i'), TIME_FORMAT(a.hora_fim, '%h:%i'), c.status from pessoa p, domestico d, logradouro l, contratacao c, agenda a where d.pessoa_idpessoa= idpessoa AND d.pessoa_idpessoa=l.pessoa_idpessoa AND d.pessoa_idpessoa=c.domestico_pessoa_idpessoa AND d.pessoa_idpessoa=a.domestico_pessoa_idpessoa AND d.pessoa_idpessoa=" +"'"+ idPessoa +"'";

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
					out.println("Rua " + rs.getString(3)+",");
					out.println("Bairro "+ rs.getString(4)+ ",");
					out.println("Número " + rs.getString(5)+ ",");
					out.println("Complemento " + rs.getString(6)+ ",");
					out.println("- " + rs.getString(7));
				%>
			</td>
			
			<td>
				<%
					out.println(rs.getString(8));
				%>
			</td>
			
			<td>
				<%
					out.println(rs.getString(9));
				%>
			</td>
			
			<td>
				<%
					out.println(rs.getString(10)+ " as ");
					out.println(rs.getString(11));
				%>
			</td>
			</td>
			
			<td>
				<%
					out.println(rs.getString(12));
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