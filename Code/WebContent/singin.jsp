<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Limpai</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/singin.css" type="text/css">

</head>
<body>
	<%@include file="cabecalho.jsp"%>

	<div class="container">
		<div class="row">
			<div class=" empregador col-sm-6 col-md-4 col-md-offset-4">
				<div class="contract-wall">
					<img class="profile-img" src="images/empregador.png" alt="">
					<h1 class="text-center login-title">Sou empregador</h1>
					<form class="form-signin" method="post" action="cadastro-empregador.jsp">
						<button class="btn btn-lg btn-primary btn-block" type="submit">
							Quero contratar</button>
					</form>
				</div>
			</div>
			<div class="diarista col-sm-6 col-md-4 col-md-offset-4">
				<div class="work-wall">
					<img class="profile-img" src="images/domestica.png" alt="">
					<h1 class="text-center login-title">Sou domestica(o)</h1>
					<form class="form-signin" method="post" action="cadastro-diarista.jsp">
						<button class="btn btn-lg btn-primary btn-block" type="submit">
							Quero trabalhar</button>
					</form>
				</div>
			</div>
		</div>
	</div>



</body>
</html>