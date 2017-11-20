<!DOCTYPE html>
<html>
 <head>
   <title>Gerenciamento de Usuários</title>
    <link rel="shortcut icon" href="http://moodle.unb.br/moodle/theme/autumn/favicon.ico" />
    <!-- Bootstrap core CSS -->
    <link href="../bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap theme -->
    <link href="../bootstrap/dist/css/bootstrap-theme.min.css" rel="stylesheet">
    <!-- -->
    <meta http-equiv="content-language" content="pt-br, en-US, fr" />
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <!-- -->
 </head>
 <body role="document">
  <div class="container">
<?php include("navbar.php");?>
     <div class="page-header">
       <h1>Gerenciamento de Usuários:</h1>
     </div>
<?php
       include 'conf.php';
       include 'functions.php';
       $a=0; $b=5; if(isset($_GET['p'])){$p=$_GET['p'];}else{$p=1 ;}; $pp=20;
	if (!isset($_GET['idu'])){die("<div class=\"alert alert-danger\">ID da Universidade faltando!</div>");}        
       $idu = $_GET['idu'];
       $dbtype = $INFO[$idu]["dbtype"];
       $inst_id = $INFO[$idu]["dbinst"];
       $_dbhost = $INFO[$idu]["dbhost"];
       $_dbname = $INFO[$idu]["dbname"];
       $_dbuser = $INFO[$idu]["dbuser"];
       $_dbpass = $INFO[$idu]["dbpass"];
       $wwwroot = $INFO[$idu]["wwwroot"];
       $course = $ESCOLAS[$INFO[$idu]["dbcourse"]];
       $msg = "host='".$SUPORTE["dbhost"]."' port=5432 dbname='".$SUPORTE["dbname"]."' user= '".$SUPORTE["dbuser"]."' password='".$SUPORTE["dbpass"]."'";
?>
         <div class="row">
           <div class="col-md-6">
             <h2><?php echo $course;?> <div class="label label-danger"><?php echo $inst_id;?></div>
             </h2>
           </div>
         <div class="col-md-6" align="right">
           <button type="button" onclick="window.open('<?php echo $wwwroot;?>')" class="btn btn-success">Acesse a plataforma</button>
         </div>
       </div>
       <br/>
         <div class="row">
	   <div class="col-md-4">
  	     <div class="panel panel-info">
	       <div class="panel-heading">
	       Dados do Coordenador
  	       </div>
		 <div class="panel-body">
     
<?php
$info_coord=infoCoord($msg, $idu);
if(!$info_coord) { ?>
		   <p>
		     <button type="button" class="btn btn-link" data-toggle="modal" data-target="#modalCoord">
  			Cadastrar Coordenador
		     </button>
		   </p>
<?php } else { ?>
		   <p>
                          Nome: <?php echo $info_coord["firstname"];?> <br/>
                          Sobrenome: <?php echo $info_coord["lastname"];?> <br/>
                          Endereço: <?php echo $info_coord["address"];?> <br/>
                          Telefone: <?php echo $info_coord["phone"];?> <br/>
                          E-mail: <?php echo $info_coord["email"];?> <br/>
		   </p>
		   <p>
		     <button type="button" class="btn btn-link" data-toggle="modal" data-target="#modalCoord">
  			Alterar Coordenador
		     </button>
		   </p> 
<?php } ?>
		  </div>
                </div>
             </div>
             <div class="col-md-4">
  	       <div class="panel panel-info">
		 <div class="panel-heading">
		   Dados do Administrador
  		 </div>
		 <div class="panel-body">
<?php
$info_admin=infoAdmin($msg, $idu);
if(!$info_admin){?>
		   <p>
		     <button type="button" class="btn btn-link" data-toggle="modal" data-target="#modalAdmin">
  			Cadastrar Administrador
		     </button>
		   </p>
<?php } else { ?>
		   <p>
                          Nome: <?php echo $info_admin["firstname"];?> <br/>
                          Sobrenome: <?php echo $info_admin["lastname"];?> <br/>
                          Endereço: <?php echo $info_admin["address"];?> <br/>
                          Telefone: <?php echo $info_admin["phone"];?> <br/>
                          E-mail: <?php echo $info_admin["email"];?> <br/>
		   </p>
		   <p>
		     <button type="button" class="btn btn-link" data-toggle="modal" data-target="#modalAdmin">
  			Alterar Administrador
		     </button>
		   </p> 
<?php } ?>
		</div>
	      </div>
	    </div>
	    <div class="col-md-4">
              <form role="form">
	      <div class="form-group">
<div class="input-group">
  <input type="text" name="q" class="form-control" placeholder="Busca usuário..." aria-describedby="basic-addon2">
  <span class="input-group-addon" id="basic-addon2">🔍</span>
</div>
	      </div>
		<input type="hidden" name="idu" value="<?php echo $idu;?>" />
	      </form>
          </div>
         </div>
<?php
  $condata["host"] = $INFO[$idu]["dbhost"];
  $condata["user"] = $INFO[$idu]["dbuser"];
  $condata["pass"] = $INFO[$idu]["dbpass"];
  $condata["name"] = $INFO[$idu]["dbname"];

  if(isset($_GET["q"])){
	$q=$_GET["q"];
        $query = "SELECT DISTINCT * FROM mdl_user WHERE firstname ilike '%".$q."%' OR lastname ilike '%".$q."%' OR username ilike '%".$q."%' OR email ilike '%".$q."%' ORDER BY id";
	$res=query_list_users($condata,$query,$p,$pp);
	print_list_users($res,$idu);
  }else{
    if(isset($_GET["start"]) && isset ($_GET["end"])){
          $a= $_GET["start"];
          $b= $_GET["end"];
    }
    if($dbtype == "mysql" )
          show_mysql_tables($condata, $a, $b);
    else
	  $res=query_list_users($condata,"SELECT * FROM mdl_user WHERE deleted<>1 ORDER BY id",$p,$pp);
	  print_list_users($res,$idu);
  };
$tp=(($res[$pp] / $pp) + 1);
?>
<div class="row">
<div class="col-md-4">
</div>
<div class="col-md-12">
 <ul class="pagination">
<?php
$counter=1;
$newget=$_GET;
unset($newget['p']);
while ($counter <= $tp ){
?>
  <li <?php if ($counter == $p ){echo 'class="active"';}?>><a href="?<?php echo http_build_query($newget)."&p=$counter";?>"><?php echo $counter;?></a></li>
<?php
$counter++;
}
?>
</ul>
</div>
</div>

</div>     
<?php include("includejs.php");?>
<!-- Modal Coord -->
<div class="modal fade" id="modalCoord" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Coordenador da Plataforma</h4>
      </div>
      <div class="modal-body">
       <form class="form-horizontal" id="formCoord">
	  <div class="form-group">
	    <label for="inputncoordNome" class="col-sm-4 control-label">Nome</label>
	    <div class="col-sm-8">
	      <input type="text" class="form-control" id="inputncoordNome" name="ncoordNome" placeholder="Digite o Nome" value="<?php print $info_coord["firstname"]; ?>">
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="inputncoordSobrenome" class="col-sm-4 control-label">Sobrenome</label>
	    <div class="col-sm-8">
	      <input type="text" class="form-control" id="inputncoordSobrenome" name="ncoordSobrenome" placeholder="Digite o Sobrenome" value="<?php print $info_coord["lastname"]; ?>">
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="inputncoordEmail" class="col-sm-4 control-label">E-mail</label>
	    <div class="col-sm-8">
	      <input type="email" class="form-control" id="inputncoordEmail" name="ncoordEmail" placeholder="Digite o e-mail" value="<?php print $info_coord["email"]; ?>">
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="inputncoordTelefone" class="col-sm-4 control-label">Telefone</label>
	    <div class="col-sm-8">
	      <input type="tel" class="form-control" id="inputncoordTelefone" name="ncoordTelefone" placeholder="Digite o telefone" value="<?php print $info_coord["phone"]; ?>">
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="inputncoordEndereco" class="col-sm-4 control-label">Endereço</label>
	    <div class="col-sm-8">
	      <input type="text" class="form-control" id="inputncoordEndereco" name="ncoordEndereco" placeholder="Digite o endereço" value="<?php print $info_coord["address"]; ?>">
	    </div>
	  </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
        <button type="button" class="btn btn-primary" onclick='$.post("update_info.php?role=1&idu=<?php echo $idu;?>", $( "#formCoord" ).serialize() , function( data ) { $( "#modalCoord" ).modal("toggle"); location.reload(); });'>Atualizar</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal Admin -->
<div class="modal fade" id="modalAdmin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        <span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Administrador da Plataforma</h4>
      </div>
      <div class="modal-body">
       <form class="form-horizontal" id="formAdmin">
	  <div class="form-group">
	    <label for="inputnadminNome" class="col-sm-4 control-label">Nome</label>
	    <div class="col-sm-8">
	      <input type="text" class="form-control" id="inputnadminNome" name="nadminNome" placeholder="Digite o Nome" value="<?php print $info_admin["firstname"]; ?>">
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="inputnadminSobrenome" class="col-sm-4 control-label">Sobrenome</label>
	    <div class="col-sm-8">
	      <input type="text" class="form-control" id="inputnadminSobrenome" name="nadminSobrenome" placeholder="Digite o Sobrenome" value="<?php print $info_admin["lastname"]; ?>">
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="inputnadminEmail" class="col-sm-4 control-label">E-mail</label>
	    <div class="col-sm-8">
	      <input type="email" class="form-control" id="inputnadminEmail" name="nadminEmail" placeholder="Digite o e-mail" value="<?php print $info_admin["email"]; ?>">
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="inputnadminTelefone" class="col-sm-4 control-label">Telefone</label>
	    <div class="col-sm-8">
	      <input type="tel" class="form-control" id="inputnadminTelefone" name="nadminTelefone" placeholder="Digite o telefone" value="<?php print $info_admin["phone"]; ?>">
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="inputnadminEndereco" class="col-sm-4 control-label">Endereço</label>
	    <div class="col-sm-8">
	      <input type="text" class="form-control" id="inputnadminEndereco" name="nadminEndereco" placeholder="Digite o endereço" value="<?php print $info_admin["address"]; ?>">
	    </div>
	  </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
        <button type="button" class="btn btn-primary" onclick='$.post("update.php?role=2&idu=<?php echo $idu;?>", $( "#formAdmin" ).serialize() , function( data ) { $( "#modalAdmin" ).modal("toggle"); location.reload(); });'>Atualizar</button>
      </div>
    </div>
  </div>
</div>

  </body>
</html>
