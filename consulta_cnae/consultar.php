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

//Pesquisa no banco de dados
$select_1 = "SELECT
	cnae_codigo,
	cnae_descricao,
	agrupamento_descricao,
	grau_de_risco_descricao,
	documentacao_descricao
FROM cnae

LEFT JOIN agrupamento
ON agrupamento.agrupamento_id = cnae.fk_agrupamento_id

LEFT JOIN cnae_e_grau_de_risco
ON cnae_e_grau_de_risco.fk_cnae_id = cnae.cnae_id

LEFT JOIN grau_de_risco
ON grau_de_risco.grau_de_risco_id = cnae_e_grau_de_risco.fk_grau_de_risco_id

LEFT JOIN cnae_e_documentacao
ON cnae_e_documentacao.fk_cnae_id = cnae.cnae_id

LEFT JOIN documentacao
ON documentacao.documentacao_id = cnae_e_documentacao.previa_fk_documentacao_id

WHERE cnae_codigo LIKE '%$consultar%' LIMIT 20";

$select_2 = "SELECT
	documentacao_descricao
FROM cnae

LEFT JOIN cnae_e_documentacao
ON cnae_e_documentacao.fk_cnae_id = cnae.cnae_id

LEFT JOIN documentacao
ON documentacao.documentacao_id = cnae_e_documentacao.inicial_fk_documentacao_id

WHERE cnae_codigo LIKE '%$consultar%' LIMIT 20";

$resultado_1 = mysqli_query($conexao, $select_1);
$resultado_2 = mysqli_query($conexao, $select_2);

if(($resultado_1) AND ($resultado_1->num_rows != 0 )){
	while($exibir_1 = mysqli_fetch_assoc($resultado_1)){
		echo "<br>";
        echo "<li>"."<b>"."CNAE (atividade Econômica): "."</b>".$exibir_1['cnae_codigo']."</li>";
		echo "<li>"."<b>"."Descrição: "."</b>".$exibir_1['cnae_descricao']."</li>";
		echo "<li>"."<b>"."Agrupamento: "."</b>".$exibir_1['agrupamento_descricao']."</li>";
		echo "<li>"."<b>"."Grau de Risco e Necessidade de Licenciamento: "."</b>".$exibir_1['grau_de_risco_descricao']."</li>";
		echo "<li>"."<b>"."Documentação Prévia: "."</b>".$exibir_1['documentacao_descricao']."</li>";
		if(($resultado_2) AND ($resultado_2->num_rows != 0 )){
			$exibir_2 = mysqli_fetch_assoc($resultado_2);
			echo "<li>"."<b>"."Documentação Inicial: "."</b>".$exibir_2['documentacao_descricao']."</li>";
		}
	}
}else{
	echo "Nenhum código encontrado...";
}


?>	

</body>
</html>	