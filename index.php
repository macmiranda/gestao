<?php include('conf.php');?>
<!DOCTYPE html>
<html>
 <head>
   <title><?php echo $title;?></title>
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
<?php include('navbar.php');?>
    <div class="page-header">
     <h1><?php echo $title;?></h1>
    </div>
  <div class="row">
   <div class="col-md-6">
<?php
$ce=0;
 foreach ($ESCOLAS as $id_escola=>$escola){
?>
    <div class="panel panel-primary">
      <div class="panel-heading"><?php echo $escola;?></div>
        <div class="panel-body">
<?php
  foreach($INFO as $chave => $valor){
      if ($INFO[$chave]["dbcourse"] == $id_escola ){
          $univ = $INFO[$chave]["dbinst"];
          $course = $INFO[$chave]["dbcourse"];
          $versao = $INFO[$chave]["versao"];
?>
            <div class="col-md-4">
              <a href="course.php?idu=<?php echo "$course.$univ";?>"><?php echo "$univ ($versao)";?></a>
            </div>
<?php  } 
    } 
 ?>
        </div> 
      </div>
<?php
$ce++;
if((sizeof($ESCOLAS) / 2) == $ce){
?>
</div><div class="col-md-6">
<?php
   }
 }
include ("includejs.php");
?>
    </div>
     </div>
    </div>
  </body>
</html>
