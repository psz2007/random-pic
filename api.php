<?php
	$pic = "pic/" + strval(rand(0,100)) + ".png";
	die(header("Location: $pic"));
?>
