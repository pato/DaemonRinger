<?php
$op = $_GET['op'];
$name = strtolower($_GET['name']);
$msg  = isset($_GET['msg'])?$_GET['msg']:"";

if ($op=="check"){
	check($name);
}else if ($op=="punch"){
	punch($name,$msg);
}

function check($name){
	$filename = $name.".txt";
	$file=fopen($filename,"r");
	$read = fread($file,filesize($filename));
	$ex = explode("\n",$read);
	$rTime = intval($ex[0]);
	$cTime = time();
	$diff = $cTime - $rTime;
	if ($diff<8){
		echo "ri".$ex[1];
	}else{
		echo "no";
	}
	fclose($file);
}
function punch($name, $msg){
	$filename = $name.".txt";
	$file=fopen($filename,"w");
	$time = time();
	fwrite($file,$time);
	fwrite($file,"\n".$msg);
	fclose($file);
}
?>