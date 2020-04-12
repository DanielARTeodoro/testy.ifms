<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Market  - Ajax</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <div class="">
                <h3 class="text-center">Market</h3>

                <form class="row" id="cadUsuario">
                    <label class="col-md-1 offset-1">
                        Quantidade: 
                        <input required type="number" name="campoQtde" class="form-control" />
                    </label>
                    <label class="col-md-6 offset-3">
                        Item: 
                        <input required type="text" name="campoItem" class="form-control" />
                    </label>
                    <label class="col-md-6 offset-3">
                        Tipo 
                        <select name="campoTipo" class="form-control">
                            <option value="">Selecione</option>
                            <option value="UNI">Unidade</option>
                            <option value="KG">Kilo</option>
                            <option value="Litro">Litro</option>
                        </select>
                    </label>
                    <label class="col-6 offset-3">
                        <button type="submit" class="btn btn-success" id="salvar">Cadastrar</button>
                    </label>

                </form>
                <div class="alert alert-dark alert-dismissible fade show col-6 offset-3" role="alert">
                    <span class="msg">Mensagem</span>
                    <button type="button" class="close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
            </div>
        </div>
        <script src="js/jquery-3.4.1.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>
        <script type="text/javascript">
            
        </script>

    </body>
</html>
