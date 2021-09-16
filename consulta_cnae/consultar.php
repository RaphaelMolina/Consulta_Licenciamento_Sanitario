<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
    <title>Resultado</title>
</head>
<body>
	</br><a class="btn btn-dark" href="index.php" role="button">Voltar</a></br>
	<div class="container">
		<h2>Resultado:</h2>
    </div></br></br>
	
<?php
	
//Incluir a conexão com banco de dados
include_once 'conexao.php';

$consultar = filter_input(INPUT_POST, 'palavra', FILTER_SANITIZE_STRING);

//Pesquisar no banco de dados nome do usuario referente a palavra digitada
$select = "SELECT cnae_codigo, cnae_nome, cnae_descricao FROM banco_cnae.tabela_cnae WHERE cnae_codigo LIKE '%$consultar%' LIMIT 20";
$resultado = mysqli_query($conexao, $select);

if(($resultado) AND ($resultado->num_rows != 0 )){
	while($exibir = mysqli_fetch_assoc($resultado)){
		echo "<br>";
        echo "<li>"."Código: ".$exibir['cnae_codigo']."</li>";
		echo "<li>"."Nome: ".$exibir['cnae_nome']."</li>";
		echo "<li>"."Descrição: ".$exibir['cnae_descricao']."</li>";
	}
}else{
	echo "Nenhum código encontrado ...";
}
	
?>	

</body>
</html>	