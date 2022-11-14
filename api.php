<?php
	header("content-type: text/html; charset = utf-8");
	$pic = "https://psz2007.github.io/random-pic/pic/" + strval(rand(0, 100)) + ".png";
	die(header("Location: $pic"));
?>
