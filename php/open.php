<?php

	// collect login variable values
	include 'conf.php';  //make sure you've put your credentials in conf.php

	// attempt to create a connection to db
	$conn = new mysqli($dbhost,$dbuser,$dbpass,$dbname);

	// report whether failure or success
	if ($conn->connect_errno) {
	   echo("Connect failed: \n".$conn->connect_error);
	   exit();
	} 

	// unless we ended with an error above, we know
	// now $conn contains a connection to dbase we can use - we'll close it
	// in another php script after we use it to execute some SQL statements

?>