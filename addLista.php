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
        $resp['class'] = "alert-success";
        $resp['status'] = 1;
    } else {
        $resp['msg'] = "Informe a quantidade.";
        $resp['class'] = "alert-danger";
        $resp['status'] = 0;
    }
    
    
    
    
    echo json_encode($resp);
}