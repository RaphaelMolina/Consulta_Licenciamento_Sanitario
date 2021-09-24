<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
    <title>Consulta de CNAE</title>
</head>
<body>
	<div class="container">
		<h1>Consultar CNAE</h1>
	</div>
	</br>
	<form method="POST" id="formulario_consulta" action="">
		<div class="well">
            <label>Digite o CNAE (conforme cartão CNPJ): </label>
			<input type="text" name="consultar" id="consultar" placeholder="Informe o CNAE aqui">
        </div>
            
	</form>
	<ul class="resultado">
		
	</ul>
		
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript" src="consulta.js"></script>
	
</body>
</html>