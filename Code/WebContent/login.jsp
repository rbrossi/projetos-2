<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Limpai Entrar</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/login.css" type="text/css">

</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="index.jsp">Limpai!</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="search.jsp">Buscar diaristas<span class="sr-only">(current)</span></a>
      </li>
    </ul>
    	<ul1 class="navbar-nav my-sm-0">
      		<li class="nav-link">
        		<a class="nav-link" href="singin.jsp">Sign In<span class="sr-only">(current)</span></a>
      		</li>    		
    		<li class="nav-link">
        		<a class="btn btn-outline-success nav-link" href="login.jsp">Login<span class="sr-only">(current)</span></a>
      		</li>
      </ul1>
 
  </div>
</nav>
   <div class="container">

      <form class="form-signin" method="post" action="logar.jsp">
        <h2 class="form-signin-heading">Entrar no Limpai!</h2>
        <label for="inputEmail" class="sr-only">Email address</label>
        <input name="email" type="email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input name="senha" type="password" id="inputPassword" class="form-control" placeholder="Password" required>
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> Remember me
          </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Entrar</button>
      </form>

    </div> 

</body>
</html>