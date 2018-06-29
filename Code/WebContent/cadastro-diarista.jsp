<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Limpai</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link href="css/bootstrap.min.css" rel="stylesheet">

	<link rel="stylesheet" href="/css/bootstrap.min.css">
	<script src="js/jquery-3.3.1.js"></script>
	<script src="js/cadastro-diarista.js"></script>
	<link rel="stylesheet" type="text/css"href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
	<%
	
	/*
	<link rel="stylesheet" href="/css/bootstrap.min.css">
	<script src="js/jquery-3.3.1.js"></script>
	<script src="js/cadastro-diarista.js"></script>
	<link rel="stylesheet" type="text/css"href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

	*/
	
	%>
	


</head>
<body>
	<%@include file="cabecalho.jsp"%>


	<div class="container">
		<div class="col-md-5">
			<div class="form-area">
				<form class="form-signin" method="post" action="valida-diarista.jsp">
					<br style="clear: both">
					<h3 style="margin-bottom: 25px; text-align: center;">Cadastro
						Diarista</h3>
					<label>Dados de acesso</label>
					<div class="form-group">
						<input type="text" class="form-control" id="name" name="nome"
							placeholder="Nome" required autofocus>
					</div>
					<div class="form-group">
						<input type="email" class="form-control" id="email" name="email"
							placeholder="Email" required>
					</div>
					<div class="form-group">
						<input type="email" class="form-control" id="email"
							name="ConfirmaEmail" placeholder="Confirme o email" required>
					</div>
					<div class="form-group">
						<input type="password" class="form-control" id="senha"
							name="senha" placeholder="Senha" required>
					</div>
					<div class="form-group">
						<input type="password" class="form-control" id="senha"
							name="ConfirmaSenha" placeholder="Confirme a senha" required>
					</div>
					<label>Dados pessoais</label>
					<div class="form-group">
						<input type="text" class="form-control" id="cpf" name="cpf"
							placeholder="CPF" required>
					</div>
					<div class="form-group">
						<input type="date" class="form-control date" id="nascimento"
							name="dataNascimento" placeholder="Data de nascimento" required>
					</div>
					<div class="form-group">
						<input type="text" class="form-control" id="telefone"
							name="telefone" placeholder="Telefone" required>
					</div>

					<label>Logradouro</label>

					<div class="form-group">
						<input type="text" class="form-control " id="estado" name="estado"
							placeholder="Estado" required>
					</div>

					<div class="form-group">
						<input type="text" class="form-control " id="cidade" name="cidade"
							placeholder="Cidade" required>
					</div>

					<div class="form-group">
						<input type="text" class="form-control " id="bairro" name="bairro"
							placeholder="Bairro" required>
					</div>


					<div class="form-group">
						<input type="text" class="form-control " id="rua" name="rua"
							placeholder="Rua" required>
					</div>


					<div class="form-group">
						<input type="text" class="form-control " id="numero" name="numero"
							placeholder="Numero" required>
					</div>

					<div class="form-group">
						<input type="text" class="form-control " id="complemento"
							name="complemento" placeholder="Complemento" required>
					</div>

					<label>Financeiro</label>
					<div class="form-group">
						<input type="text" class="form-control" id="valor-diaria"
							name="valor" placeholder="Valor da diaria (Ex. R$ 50,00)"
							required>
					</div>
					<label>Quais serviços você oferece?</label>



						<div class="form-group">
							<div class="input-group control-group after-add-more">
								<input type="text" name="servico[]" id="servico"
									class="form-control" placeholder="Serviço que você oferece">
								<input type="text" name="descricao[]" id="descricao"
									class="form-control" placeholder="Descrição do serviço que você oferece">
								<div class="input-group-btn">
									<button class="btn btn-success add-more" type="button">
										<i class="glyphicon glyphicon-plus"></i>
									</button>
								</div>
							</div>
						</div>


						<div class="copy hide">
							<div class="control-group input-group" style="margin-top: 10px">
								<input type="text" name="servico[]" class="form-control"
									placeholder="Serviços que você oferece">
								<input type="text" name="descricao[]" id="descricao"
									class="form-control" placeholder="Descrição do serviço que você oferece">
								<div class="input-group-btn">
									<button class="btn btn-danger remove" type="button">
										<i class="glyphicon glyphicon-remove"></i>
									</button>
								</div>
							</div>
						</div>
			
			


					<button class="btn  btn-primary pull-right" type="submit">Cadastrar</button>


				</form>
			</div>
		</div>
	</div>
	</form>
	</div>
</body>
</html>