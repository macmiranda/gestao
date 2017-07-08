#!/bin/sh
INSTANCES="instances.php"
MOODLEDIR="/moodle/html"
echo "<?php" > $INSTANCES
for i in $MOODLEDIR/*/*/config.php
do 
        echo "\$idu='`echo $i|sed "s#$MOODLEDIR##"|cut -d"/" -f2`.`echo $i|sed "s#$MOODLEDIR##"|cut -d"/" -f3`';" >> $INSTANCES

        TIPO=`grep -v ^# $i | grep -v "^//"  | grep 'CFG->dbtype'    | cut -d ";" -f1 | cut -d "=" -f2` 
        HOST=`grep -v ^# $i | grep -v "^//"  | grep 'CFG->dbhost'    | cut -d ";" -f1 | cut -d "=" -f2`
        BD=`grep -v ^# $i | grep -v "^//"  | grep 'CFG->dbname'      | cut -d ";" -f1 | cut -d "=" -f2`
        USUARIO=`grep -v ^# $i | grep -v "^//"  | grep 'CFG->dbuser' | cut -d ";" -f1 | cut -d "=" -f2`
        SENHA=`grep -v ^# $i | grep -v "^//"  | grep 'CFG->dbpass'   | cut -d ";" -f1 | cut -d "=" -f2`
        WWWROOT=`grep -v ^# $i | grep -v "^//"  | grep 'CFG->wwwroot'   | cut -d ";" -f1 | cut -d "=" -f2`
        VFILE=`echo $i | sed 's/config.php/version.php/'`
        VERSAO=`grep \\$release $VFILE | cut -d"'" -f2 |  sed 's/(Build.*)//'`

        echo "\$INFO[\$idu][\"dbtype\"] = $TIPO;" >> $INSTANCES
        echo "\$INFO[\$idu][\"dbhost\"] = $HOST;" >> $INSTANCES
        echo "\$INFO[\$idu][\"dbname\"] = $BD;" >> $INSTANCES
        echo "\$INFO[\$idu][\"dbuser\"] = $USUARIO;" >> $INSTANCES
        echo "\$INFO[\$idu][\"dbpass\"] = $SENHA;" >> $INSTANCES
        echo "\$INFO[\$idu][\"wwwroot\"] = $WWWROOT;" >> $INSTANCES
        echo "\$INFO[\$idu][\"versao\"] = \"$VERSAO\";" >> $INSTANCES
        echo "\$INFO[\$idu][\"dbinst\"] = \"`echo $i|sed "s#$MOODLEDIR##"|cut -d"/" -f3`\";" >> $INSTANCES
        echo "\$INFO[\$idu][\"dbcourse\"] = \"`echo $i|sed "s#$MOODLEDIR##"|cut -d"/" -f2`\";" >> $INSTANCES
done

echo " " >> $INSTANCES
echo "?>" >> $INSTANCES

