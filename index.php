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

                <form class="row" id="cadItens">
                    <label class="col-md-2">
                        Quantidade: 
                        <input id="txtQtde" required type="number" name="campoQtde" class="form-control" />
                    </label>
                    <label class="col-md-5">
                        Item: 
                        <input id="txtItem" required type="text" name="campoItem" class="form-control" />
                    </label>
                    <label class="col-md-3">
                        Tipo 
                        <select id="cboTipo" name="campoTipo" class="form-control">
                            <option value="">Selecione</option>
                            <option value="UNI">Unidade</option>
                            <option value="KG">Kilo</option>
                            <option value="Litro">Litro</option>
                        </select>
                    </label>
                    <label class="col-md-1">
                        Add
                        <button type="submit" class="btn btn-success" id="salvar">Cadastrar</button>
                    </label>

                </form>
                <div class="escondedor alert alert-dismissible fade show col-6 offset-3" role="alert">
                    <span class="msg">Mensagem</span>
                    <button type="button" class="close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="col-6 offset-3" id="lista">
                    
                </div>
            </div>
        </div>
        <script src="js/jquery-3.4.1.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function(){
                lista();
                // Cria função para submissão do formulário
                $("#cadItens").submit(function(){
                    // Pega dados do formulário e armazena 
                    // na variável ITEM
                    var item = $("#cadItens").serialize();
                    
                    $.ajax({
                        type: 'POST',
                        dataType: 'json',
                        url: 'addLista.php',
                        async: true,
                        data: item,
                        success: function(resp) {
                            //alert(resp.msg);
                            $('.msg').html(resp.msg);
                            $('.escondedor').removeClass("alert-success");
                            $('.escondedor').removeClass("alert-danger");
                            $('.escondedor').addClass(resp.class);
                            $('.escondedor').show();
                            if(resp.status == 1) {
                                lista();
                                $('#txtQtde').val('');
                                $('#txtItem').val('');
                                $('#cboTipo').val('');
                            }
                        }
                    });
                    return false;
                });
                $('.close').click(function() {
                    $('.escondedor').hide();
                });
                // Busca lista
                function lista() {
                    $.ajax({
                        type: 'POST',
                        dataType: 'json',
                        url: 'buscaLista.php',
                        success: function(dados) {
                            $('#lista').html(dados.lista);
                        }
                    });
                }
                // Final busca lista
            });
            
         
        </script>

    </body>
</html>
