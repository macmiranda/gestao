<?php

function show_pg_tables($condata, $st, $end){
$con_msg = "host={$condata["host"]} port=5432 dbname={$condata["name"]} user={$condata["user"]} password={$condata["pass"]}";
$cn = pg_connect($con_msg) or die ("could not connect");
  if($st==0 && $end==0)
     $sql_query = "SELECT * FROM mdl_user where id<6 order by id";
  else
     $sql_query = "SELECT * FROM mdl_user where id>=$st and id<=$end order by id";
$result = pg_query($cn, $sql_query);
$myrow = pg_fetch_assoc($result);
pg_close($cn);
print  '
	<table class="table table-striped">
                <thead><tr>
                   <th>ID</th>
                   <th>Usuário</th>
                   <th>Nome</th>
                   <th>Sobrenome</th>
                   <th>E-mail</th>
                   <th>Opções</th>
                 </tr></thead>
               <tbody>
';   
while($myrow = pg_fetch_assoc($result)){
print "
	<tr>
		<td>{$myrow['id']}</td>
                <td>{$myrow['username']}</td>
                <td>{$myrow['firstname']}</td>
                <td>{$myrow['lastname']}</td>
                <td>{$myrow['email']}</td>
                <td><a href=\"user.php?uid={$myrow['id']}&idconf={$condata["bdid"]}\" >Alterar</a></td>
	</tr> ";
 }
print '</tbody></table>';
}

function show_mysql_tables($condata, $st, $end){
$cn = mysql_connect($condata["host"], $condata["user"], $condata["pass"]) or die ("Erro :" . mysql_error());
mysql_select_db($condata["name"], $cn) or die ("Erro :" . mysql_error());
     
  if ($st==0 && $end ==0)
     $sql_query = "SELECT * FROM mdl_user where id<6";
  else
     $sql_query = "SELECT * FROM mdl_user where id>=$st and id<=$end order by id";
$result = mysql_query($sql_query, $cn);
mysql_close($cn);
print  '
	<table class="table table-striped">
                <thead><tr>
                   <th>ID</th>
                   <th>Usuário</th>
                   <th>Nome</th>
                   <th>Sobrenome</th>
                   <th>E-mail</th>
                   <th>Opções</th>
                 </tr></thead>
               <tbody>
';   
while($myrow = mysql_fetch_assoc($result)){
print "
	<tr>
		<td>{$myrow['id']}</td>
                <td>{$myrow['username']}</td>
                <td>{$myrow['firstname']}</td>
                <td>{$myrow['lastname']}</td>
                <td>{$myrow['email']}</td>
                <td><a href=\"user.php?uid={$myrow['id']}&idconf={$condata["bdid"]}\" >Alterar</a></td>
	</tr> ";
}    
print '</tbody></table>';
}

function infoCoord($msg, $idu){
            $cn = pg_connect($msg) or die ("could not connect");
            $query_msg = "SELECT * FROM suporte_status_curso WHERE id_course = "."'".$idu."'";
	     if($result = pg_query($cn, $query_msg))
                $query_coord = "SELECT * FROM suporte_coord WHERE id_course = "."'".$idu."'";
             else
                die ("postgres error:".  pg_error()  ."<br/>");

                if($result_coord = pg_query($cn, $query_coord))
                     $info_coord = pg_fetch_assoc($result_coord);    
                else
                    die (pg_error());                 
             pg_close($cn);
	     return $info_coord;
}
function infoAdmin($msg, $idu){
            $cn = pg_connect($msg) or die ("could not connect");
            $query_msg = "SELECT * FROM suporte_status_curso WHERE id_course = "."'".$idu."'";
	     if($result = pg_query($cn, $query_msg))
                $query_admin = "SELECT * FROM suporte_admin WHERE id_course = "."'".$idu."'";
             else
                die ("postgres error:".  pg_error()  ."<br/>");

                if($result_admin = pg_query( $cn, $query_admin))   
                     $info_admin = pg_fetch_assoc($result_admin);   
                else
                    die (pg_error());
             pg_close($cn);
             return $info_admin;
}

function query_list_users($condata, $q, $p, $pp){

$con_msg = "host={$condata["host"]} port=5432 dbname={$condata["name"]} user={$condata["user"]} password={$condata["pass"]}";
$conn = pg_connect($con_msg) or die ("could not connect");
$total = pg_num_rows(pg_query($q));
$res=pg_fetch_all(pg_query($conn,$q." OFFSET ".(($p - 1)* $pp)." LIMIT $pp"));
$res[$pp] = $total;
return $res;
}

function print_list_users($res,$idu){

print  '
	<table class="table table-striped">
                <thead><tr>
                   <th>ID</th>
                   <th>Usuário</th>
                   <th>Nome</th>
                   <th>Sobrenome</th>
                   <th>E-mail</th>
                   <th>Opções</th>
                 </tr></thead>
               <tbody>
';   
if ($res != NULL){
 foreach($res as $key => $row){
    if (is_array($row)){
 print " <tr>";
 print "		<td>{$row['id']}</td>";
 print "		<td>{$row['username']}</td>";
 print "		<td>{$row['firstname']}</td>";
 print "		<td>{$row['lastname']}</td>";
 print "		<td>{$row['email']}</td>";
 print "         <td><a href=\"user.php?uid={$row['id']}&idconf=$idu\" >Alterar</a></td>";
 print "	</tr>";
  }
 }
}
print '</tbody></table>';

}
?> 
