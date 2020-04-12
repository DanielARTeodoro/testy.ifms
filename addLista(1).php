<?php
if(isset($_POST)) {
    
    $qtde = $_POST['campoQtde'];
    $item = $_POST['campoItem'];
    $tipo = $_POST['campoTipo'];
    
    if($qtde > 0) {
        include 'conexao.php';
        
        $sql = "insert into lista
            (quantidade, item, tipo)
            values
            ('$qtde', '$item', '$tipo')";
        
        $rs = $conexao->query($sql);
        
        $resp['msg'] = "Gravado com sucesso!";
    } else {
        $resp['msg'] = "Informe a quantidade.";
    }
    
    
    
    
    echo json_encode($resp);
}