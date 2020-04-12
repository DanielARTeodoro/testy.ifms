<?php
header("Location: home/");
exit();

include '../helpers/conexao/conexao.php';
?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Administração</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="font/css/all.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <?php include 'includes/topo.php'; ?>
        <div class="container">
            <div class="row">
                <div class="col-md-6 offset-3">
                    <form action="../controllers/usuarios/edit.php" method="post" class="col-md-9" enctype="multipart/form-data">
                        <h4>Acesso ao sistemas</h4>
                        <div class="form-group">
                            <label for="idEmail">E-mail:</label>
                            <input type="text" name="campoEmail"
                                   class="form-control" id="idEmail"
                                   required />
                        </div>
                        <div class="form-group">
                            <label for="idSenha">Senha:</label>
                            <input type="password" name="campoSenha"
                                   class="form-control" id="idSenha"
                                   required />
                        </div>
                        <button type="submit" class="btn btn-success">
                            Entrar
                        </button>
                    </form>
                </div>
            </div>
        </div>

        <script src="js/jquery-3.4.1.js" type="text/javascript"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>
    </body>
</html>
