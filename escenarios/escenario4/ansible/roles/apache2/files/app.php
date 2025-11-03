<?php
$start=microtime(true);
$area=0.0;
#$n=$_GET["n"];
$n=1000000;
for ($i=0; $i<$n; $i++)
{
$x=($i+0.5)/$n;
$area=$area+4.0/(1.0+$x*$x);
}
$result=$area/$n;
$end=microtime(true);
$exectime=$end-$start;
echo "<br>Calculo de PI<br><br>";
printf ("La cte. PI con n= %d es igual a %f<br>", $n, $result);
printf ("Tiempo de ejecucion= %.5f segundos<br>",$exectime);
printf ("<br>El servidor es %s<br>", $_SERVER[’SERVER_ADDR’]);
?>