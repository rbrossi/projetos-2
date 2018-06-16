<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Dashboard</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/search.css">
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
	</div>
	</nav>

	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<h1>Agenda semanal</h1>
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

							<th><input type="checkbox" id="checkall" /></th>
							<th>Cliente</th>
							<th>Telefone</th>
							<th>Endereco</th>
							<th>Contato</th>

						</thead>
						<tbody>

							<tr>
								<td><input type="checkbox" class="checkthis" /></td>
								<td>Mohsin</td>
								<td>isometric.mohsin@gmail.com</td>
								<td>CB 106/107 Street # 11 Wah Cantt Islamabad Pakistan</td>
								<td>+923335586757</td>
								<td>R$ 1000</td>
							</tr>

							<tr>
								<td><input type="checkbox" class="checkthis" /></td>
								<td>Mohsin</td>
								<td>isometric.mohsin@gmail.com</td>
								<td>CB 106/107 Street # 11 Wah Cantt Islamabad Pakistan</td>
								<td>+923335586757</td>
								<td>R$ 1000</td>
							</tr>

							<tr>
								<td><input type="checkbox" class="checkthis" /></td>
								<td>Mohsin</td>
								<td>isometric.mohsin@gmail.com</td>
								<td>CB 106/107 Street # 11 Wah Cantt Islamabad Pakistan</td>
								<td>+923335586757</td>
								<td>R$ 1000</td>
							</tr>

							<tr>
								<td><input type="checkbox" class="checkthis" /></td>
								<td>Mohsin</td>
								<td>isometric.mohsin@gmail.com</td>
								<td>CB 106/107 Street # 11 Wah Cantt Islamabad Pakistan</td>
								<td>+923335586757</td>
								<td>R$ 1000</td>
							</tr>

							<tr>
								<td><input type="checkbox" class="checkthis" /></td>
								<td>Mohsin</td>
								<td>isometric.mohsin@gmail.com</td>
								<td>CB 106/107 Street # 11 Wah Cantt Islamabad Pakistan</td>
								<td>+923335586757</td>
								<td>R$ 1000</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>