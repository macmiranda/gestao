<?php

include 'conf.php';                        
$idu = trim($_GET["idu"]);
$role = trim($_GET["role"]);
$ip = "host='".$SUPORTE["dbhost"]."' port=5432 dbname='".$SUPORTE["dbname"]."' user='". $SUPORTE["dbuser"]."' password='".$SUPORTE["dbpass"]."'";
$conn = pg_connect($ip) or die ("could not connect");


if ($role == 1){
$nome = trim($_POST["ncoordNome"]);
$sobrenome = trim($_POST["ncoordSobrenome"]);
$address = trim($_POST["ncoordEndereco"]);
$telefone = trim($_POST["ncoordTelefone"]);
$date = date("Y-m-d");
$email = trim($_POST["ncoordEmail"]);
$tb_suporte="suporte_coord";
$id_role="id_coord";
$is_role="is_coord";
}
else{
$nome = trim($_POST["nadminNome"]);
$sobrenome = trim($_POST["nadminSobrenome"]);
$address = trim($_POST["nadminEndereco"]);
$telefone = trim($_POST["nadminTelefone"]);
$date = date("Y-m-d");
$email = trim($_POST["nadminEmail"]);
$tb_suporte="suporte_admin";
$id_role="id_admin";
$is_role="is_admin";
}
if (pg_num_rows(pg_query($conn,"SELECT id_course FROM $tb_suporte WHERE id_course='$idu'")))
  $xquery = sprintf("UPDATE $tb_suporte SET firstname='%s', lastname='%s', address='%s', phone='%s', adm_date='%s', email='%s' WHERE id_course='%s'", $nome, $sobrenome, $address,$telefone, $date, $email, $idu );
else
  $xquery = sprintf("INSERT INTO $tb_suporte (firstname, lastname, address, phone, adm_date, email, id_course) VALUES('%s', '%s', '%s', '%s', '%s', '%s', '%s')", $nome, $sobrenome, $address,$telefone, $date, $email, $idu );

pg_query($conn, $xquery) or die("Erro ao inserir!");;

$x=pg_fetch_assoc(pg_query($conn, "SELECT id as id FROM $tb_suporte WHERE id_course='$idu'"),'id');

if (pg_num_rows(pg_query($conn,"SELECT * FROM suporte_status_curso WHERE id_course='$idu' AND $is_role=1")))
  $zquery = "UPDATE suporte_status_curso SET $id_role='".$x["id"]."' WHERE id_course='$idu' AND $is_role=1";
else
  $zquery = sprintf("INSERT INTO suporte_status_curso (id_course, $id_role, $is_role) VALUES('%s', %s, %d)" ,$idu, $x["id"], 1);

if( pg_query($conn, $zquery) )
   print "OK";
else
   print pg_error(); 
pg_close($conn);
?>
