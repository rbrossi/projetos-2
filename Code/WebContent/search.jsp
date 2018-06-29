<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Buscar Diaristas</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/search.css">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<a class="navbar-brand" href="index.jsp">Limpai!</a>
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
		<li class="nav-link"><a class="nav-link" href="empregador-dashboard.jsp">Meu perfil<span
				class="sr-only">(current)</span></a></li>
		</ul1>
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






	<!--  <div class="jumbotron">
  <div class="container">
    <h1>Limpai!</h1>
    <p>Deixando sua vida mais brilhante.</p>
    
  </div>
</div> -->



</body>
</html>