<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page language="java" import="database.ConectaBD"%>
<%@page language="java" import="java.sql.*"%>
<%
	String cidade = request.getParameter("cidade");

	String cidadee = null;
%>
<head>
<title>Busca</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/r_busca.css">
</head>


<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light"> <a
		class="navbar-brand" href="index.jsp">Limpai!</a>
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
		</ul1>
		<!--   <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form> -->
	</div>
	</nav>
	
	
		<div class="container">
		<div class="row">
			<div class="search">

				<form name="buscar" method="post" action="buscar-banco.jsp">
					<input name="cidade" type="text" class="form-control input-sm"
						maxlength="64" placeholder="Digite sua cidade" required autofocus />
					<button type="submit" class="btn btn-primary btn-sm">Buscar
						diaristas!</button>
						
				</form>
				<br>
				<br>

				
			</div>
		</div>
	</div>
	

<table class="table table-striped">
	<thead>
		<tr>
			<th>Nome</th>
			<th>Cidade</th>
			<th>Telefone</th>
			<th>Serviço</th>
			<th>Valor</th>
		</tr>
	</thead>	

	<%
	
		try {
			Connection con = ConectaBD.getConnection();
			String query = "select nome, cidade, telefone, servico, valor from usuarios where cidade = '" + cidade + "' and isEmpregador = 'false'";
			PreparedStatement stmt = con.prepareStatement(query);
			ResultSet rs = stmt.executeQuery(query);
			while (rs.next()) {
	%>

	<tr>		
		<td>
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
			// out.println(rs.getString(1));
			 //out.println(rs.getString(2)); 
			//out.println(rs.getString(3));
			 //out.println(rs.getString(4));
	%>
	</tbody>
</table>
</body>
<%
	//response.sendRedirect("errou.jsp");

		con.close();

	} catch (Exception e) {
		out.println(e.toString());

	}
%>