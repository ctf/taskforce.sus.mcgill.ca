<?php

//$raw = file_get_contents("http://staff.sus.mcgill.ca/services/getPrinterStatus.php?", false, NULL);


$array = array(
	'backup' => array(
		'state' => mt_rand(0, 1),
		'jobs' => mt_rand(0, 5),
	),
	'1b18a' => array(
		'state' => mt_rand(0, 1),
		'jobs' => mt_rand(0, 10),
	),
	'1b17a' => array(
		'state' => mt_rand(0, 1),
		'jobs' => mt_rand(0, 15),
	),
	'1b16a' => array(
		'state' => mt_rand(0, 1),
		'jobs' => mt_rand(0, 20),
	),
);

echo json_encode($array);


?>
