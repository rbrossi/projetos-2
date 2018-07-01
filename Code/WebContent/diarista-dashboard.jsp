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
				<th>Contato</th>
				<th>Endereço</th>
				<th>Descrição do serviço</th>
				<th>Data</th>
				<th>Horário</th>	
				<th>Status</th>
				<th></th>
			</tr>
		</thead>
		<tbody>

		<%
			try {
				Connection con = ConectaBD.getConnection();

				String query = "select p.nome, p.telefone, l.rua, l.bairro, l.numero, l.complemento, l.estado, c.descricao_servico, DATE_FORMAT(a.data, '%d/%m/%Y'), TIME_FORMAT(a.hora_inicio, '%h:%i'), TIME_FORMAT(a.hora_fim, '%h:%i'), c.status from pessoa p, logradouro l, contratacao c, agenda a where c.empregador_pessoa_idpessoa=p.idpessoa AND c.empregador_pessoa_idpessoa=l.idlogradouro AND c.domestico_pessoa_idpessoa=a.domestico_pessoa_idpessoa AND c.domestico_pessoa_idpessoa=" +"'"+ idPessoa +"'"  +" order by c.status";

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
		        switch (Integer.parseInt(rs.getString(12))) {
	            case 0:
	            	out.println("Execução Pendente");
	                break;
	            case 1:
	            	out.println("Avaliação Pendente");
	                break;
	            case 2:
	            	out.println("Concluido");
	                break;
	         }
				
				%>
			</td>
			
			<td>
				<!-- Button trigger modal -->
				<button type="button" class=" btn-danger btn-center"
					data-toggle="modal" data-target="#exampleModal">Cancelar</button> <!-- Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Cancelar</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<form method="post" action="cancelar.jsp">
								<div class="modal-body">
									Tem certeza que deseja cancelar o serviço?
									<div class="form-check">
										<input class="form-check-input" type="checkbox" name="SIM">
										<label class="form-check-label">SIM</label>
									</div>
								</div>
								<div class="modal-footer">
									<button type="submit">Cancelar</button>
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
	</body>