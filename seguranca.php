<?php
class Seguranca {

    # Método para sair do sistema
    public static function Sair() {
        unset($_SESSION['id_login']);
        unset($_SESSION['nome_login']);
        unset($_SESSION['email_login']);
        header("Location: ../../view/usuarios/login.php");
        exit;
    }

    # Método de verificação de autenticação
    public static function VerificaAutenticacao() {
        if (Seguranca::GetVarSESSION('nome_login') == '') {
            header("Location: ../../view/usuarios/login.php?status=2");
            exit;
        }
    }

    # Método para pegar dados da Sesssão
    public static function GetVarSESSION($var) {
        return (isset($_SESSION[$var])) ? $_SESSION[$var] : '';
    }

}

