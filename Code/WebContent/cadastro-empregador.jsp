<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Limpai</title>
<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
	<%@include file="cabecalho.jsp"%>


	<div class="container">
		<div class="col-md-5">
			<div class="form-area">
				<form class="form-signin" method="post"
					action="valida-empregador.jsp">
					<br style="clear: both">
					<h3 style="margin-bottom: 25px; text-align: center;">Cadastro
						empregador</h3>
					<label>Dados de acesso</label>
					<div class="form-group">
						<input type="text" class="form-control" id="name" name="nome"
							placeholder="Nome" required>
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
						<input type="date" class="form-control" id="nascimento"
							name="dataNascimento" placeholder="Data de nascimento" required>
					</div>
					
					<div class="form-group">
						<input type="text" class="form-control" id="telefone"
							name="telefone" placeholder="Telefone" required>
					</div>
					
					<label>Logradouro</label>

					<div class="form-group">
						<input type="text" class="form-control " id="estado"
							name="estado" placeholder="Estado" required>
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






					<button class="btn  btn-primary pull-right" type="submit">Cadastrar</button>

				</form>
			</div>
		</div>
	</div>
	</form>
	</div>
</body>
</html>