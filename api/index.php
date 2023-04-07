<?php
	$list = "../list.json";
	if(!file_exists($list)){
		die('list error');
	}
	$file = file_get_contents($list);
	$pics = json_decode($file);
	$pic = $pics[array_rand($pics)];
	die(header('Location: ../$pic'));
?>
