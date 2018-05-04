<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Limpai Home</title>
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
		<li class="nav-link"><a class="nav-link" href="singin.jsp">Sign
				In<span class="sr-only">(current)</span>
		</a></li>
		<li class="nav-link"><a class="btn-outline-success nav-link"
			href="login.jsp">Login<span class="sr-only">(current)</span></a></li>
		</ul1>
		<!--   <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form> -->
	</div>
	</nav>

<div class="container">
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <h1>Pesquise por cidade!</h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 col-md-offset-3">
            <form action="" class="search-form">
                <div class="form-group has-feedback">
            		<label for="search" class="sr-only">Digite a cidade</label>
            		<input type="text" class="form-control" name="search" id="search" placeholder="search">
              		<span class="glyphicon glyphicon-search form-control-feedback"></span>
            	</div>
            </form>
        </div>
    </div>
</div>

	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>

	<div class="container">
		<div class="row">


			<div class="col-md-12">
				<h4>Nome da cidade</h4>
				<div class="table-responsive">


					<table id="mytable" class="table table-bordred table-striped">

						<thead>

							<th><input type="checkbox" id="checkall" /></th>
							<th>Nome</th>
							<th>Email</th>
							<th>Endereco</th>
							<th>Contato</th>
							<th>Valor</th>

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