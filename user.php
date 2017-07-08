<?php
include 'conf.php';
$user_id = $_GET["uid"];
$_idconf = $_GET["idconf"];
$_dbhost = $INFO[$_idconf]["dbhost"];
$_dbname = $INFO[$_idconf]["dbname"];
$_dbuser = $INFO[$_idconf]["dbuser"];
$_dbpass = $INFO[$_idconf]["dbpass"];
$msg = "host=$_dbhost port=5432 dbname=$_dbname user= $_dbuser password=$_dbpass";
$cn = pg_connect($msg) or die ("could not connect");

     if (isset($_POST["submitPass"])) {
       if(isset($_POST["new_pass1"]) && isset($_POST["new_pass2"])){
       $pass1 = $_POST["new_pass1"];
       $pass2 = $_POST["new_pass2"]; 
         if($pass1 == $pass2  && $pass1 != NULL){
             $sql_query = "UPDATE mdl_user
                           SET password='".md5($pass1)."'
                           WHERE id='$user_id'";
               if(pg_query($cn, $sql_query ))
			$res = [ "msg" => "Senha alterada com sucesso.", "greet" => "Sucesso!", "color" => "success", ];
               else
			$res = [ "msg" => "A senha não pôde ser alterada.", "greet" => "Erro!", "color" => "danger", ];
         }else
			$res = [ "msg" => "As senhas não conferem.", "greet" => "Atenção!", "color" => "warning", ];
       }
      }
       if(isset($_POST["submitMail"]))
       { 
       $email = $_POST["mail_f"];
             $sql_query = "UPDATE mdl_user
                           SET email='$email'
                           WHERE id ='$user_id'";
               if(pg_query($cn, $sql_query ))
			$res = [ "msg" => "E-mail alterado com sucesso.", "greet" => "Sucesso!", "color" => "success", ];
               else
			$res = [ "msg" => "E-mail não pôde ser alterado.", "greet" => "Erro!", "color" => "danger", ];
       }
       if(isset($_POST["submitLogin"]))
       { 
       $username = $_POST["login_user"];
             $sql_query = "UPDATE mdl_user
                           SET username='$username'
                           WHERE id ='$user_id'";
             if(pg_query($cn, $sql_query ))
			$res = [ "msg" => "Nome de usuário alterado com sucesso.", "greet" => "Sucesso!", "color" => "success", ];
               else
			$res = [ "msg" => "Nome de usuário não pôde ser alterado.", "greet" => "Erro!", "color" => "danger", ];
       }
      if(isset($_POST["submitName"])){
        $fname = $_POST["fname"];
        $lname = $_POST["lname"];
        if($_POST["fname"]!=null && $_POST["lname"]!=null)
        {
		$sql_query = "UPDATE mdl_user
                              SET firstname='$fname', lastname='$lname' 
                              WHERE id='$user_id'";
                if(pg_query($cn, $sql_query))
			$res = [ "msg" => "Nome alterado com sucesso.", "greet" => "Sucesso!", "color" => "success", ];
               else
			$res = [ "msg" => "Nome não pôde ser alterado.", "greet" => "Erro!", "color" => "danger", ];
                          
          }
          else
			$res = [ "msg" => "Nome e/ou sobrenome está(ão) faltando.", "greet" => "Atenção!", "color" => "warning", ];
       }
       if(isset($_POST["submitMd5"]))
       { 
             $newmd5 = $_POST["newmd5"];
             $sql_query = "UPDATE mdl_user
                           SET password='$newmd5'
                           WHERE id ='$user_id'";
             	if(pg_query($cn, $sql_query ))
			$res = [ "msg" => "Novo MD5 aplicado com sucesso.", "greet" => "Sucesso!", "color" => "success", ];
               else
			$res = [ "msg" => "MD5 não pôde ser alterado.", "greet" => "Erro!", "color" => "danger", ];
       }
       if(isset($_POST["submitDelBox"]))
       { 
            $value = $_POST["delete_box"];
            $sql_query = "UPDATE mdl_user
                           SET deleted='$value'
                           WHERE id ='$user_id'";
            	if($value == 1 && pg_query($cn, $sql_query ))
			$res = [ "msg" => "Usuário deletado.", "greet" => "Sucesso!", "color" => "success", ];
            	elseif ($value == 0 && pg_query($cn, $sql_query ))
			$res = [ "msg" => "Usuário recuperado.", "greet" => "Sucesso!", "color" => "success", ];
		else
			$res = [ "msg" => "Operação não pôde ser concluída.", "greet" => "Erro!", "color" => "danger", ];
       }
if (isset($res))
$alert="<div class=\"alert alert-{$res['color']} fade in\">
  <a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>
  <strong>{$res['greet']}</strong> {$res['msg']} 
</div>";
$sql_query = 'SELECT * FROM mdl_user WHERE id = '.$user_id;
$result = pg_query($cn, $sql_query);
$srow = pg_fetch_assoc($result);
pg_close($cn); 
?>
<!DOCTYPE html>
<html>
 <head>
   <title>Alteração de Dados </title>
    <link rel="shortcut icon" href="http://moodle.unb.br/moodle/theme/autumn/favicon.ico" />
    <!-- Bootstrap core CSS -->
    <link href="../bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap theme -->
    <link href="../bootstrap/dist/css/bootstrap-theme.min.css" rel="stylesheet">
    <link href="index.css" rel="stylesheet">
    <!-- -->
    <meta http-equiv="content-language" content="pt-br, en-US, fr" />
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <!-- -->
 </head>
<body role="document" style="overflow-y:scroll;">
<div class="container">
<?php include("navbar.php");?>
<?php if (isset($alert)){print $alert;}?>
<div class="page-header">
  <h1>Alteração de Dados</h1>
</div>
        <h2><span class="glyphicon glyphicon-user" aria-hidden="true"></span> <?php print $srow["firstname"]." ".$srow["lastname"]; ?> - <?php print $srow["email"]; ?> </h2>
<br/>
  <form role="form" method="post" action="" class="form-inline">
    <div class="form-group">
             <label for="pass1">Nova Senha:</label>
             <input type="password" class="form-control" name="new_pass1" id="pass1"/>
    </div>
    <div class="form-group">
             <label for="pass2">Confirmar Nova Senha:</label>
             <input type="password" class="form-control" name="new_pass2" id="pass2"/>
    </div>
             <button type="submit" name="submitPass" class="btn btn-default">Alterar Senha</button>
  </form>
<br/>
  <form role="form" method="post" action="" class="form-inline">
    <div class="form-group">
             <label for="pass1">Nome de Usuário:</label>
             <input type="text" class="form-control" name="login_user" id="login_name" value="<?php print $srow["username"]; ?>" />
    </div>
             <button type="submit" name="submitLogin"  class="btn btn-default">Alterar Usuário</button>
  </form>
<br/>
  <form role="form" method="post" action="" class="form-inline">
    <div class="form-group">
          <label for="ff1">E-mail:</label> 
    	  <input type="text" class="form-control"  name="mail_f" id="ff1" value="<?php print $srow["email"]; ?>"   />    
    </div>
    	  <button type="submit" name="submitMail" class="btn btn-default">Altera E-mail</button>    
   </form>
<br/>
   <!--    -->
  <form role="form" method="post" action="" class="form-inline">
    <div class="form-group">
             <label for="name1">Nome:</label>
             <input type="text" class="form-control" name="fname" id="name1" value="<?php print $srow["firstname"];?>"/>
    </div>
    <div class="form-group">
             <label for="name2">Sobrenome:</label>
             <input type="text" class="form-control" name="lname" id="name2" value="<?php print $srow["lastname"]; ?>"/>
    </div>
    	 <button type="submit" name="submitName" class="btn btn-default">Enviar</button>    
  </form>
<br/>
  <!--    -->
  <form role="form" method="post" action="">
    <div class="form-group">
           <label for="passmd5">Nova MD5:</label>
           <input type="text" class="form-control" name="newmd5" id="passmd5" value="<?php print $srow["password"]; ?>"  />
    </div>
           <button type="submit" name="submitMd5" class="btn btn-default">Alterar MD5</button>
  </form>  
<br/>
  <form role="form" method="post" action="" class="form-inline">
    <div class="form-group">
      <label for="sel1">Excluído:</label>
      <select class="form-control" id="sel1" name="delete_box">
		<?php
                    $is_deleted = $srow["deleted"];
                    if($is_deleted == 0){
                    	print "<option value=\"0\">N&atilde;o</option>";   
			print "<option value=\"1\">Sim</option>";			
			}
                    else{
			print "<option value=\"1\">Sim</option>";
			print "<option value=\"0\">N&atilde;o</option>";			
			}	
                ?>
       </select>
    </div>
           <button type="submit" name="submitDelBox" class="btn btn-default">Alterar</button> &nbsp; &nbsp; &nbsp; &nbsp;
           <input action="action" class="btn btn-primary" type="button" value="Voltar" onclick="history.go(-1);" />
  </form>
</div>
<?php include("includejs.php");?>
</body>
</html>
