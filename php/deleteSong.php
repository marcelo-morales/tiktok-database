<head>
    <title>Deleting a Song </title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
		integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>

<body>
    <?php
    include 'open.php';

    echo "<h2>Will retrieve all song info and will see that your song is not found</h2><br>";
      // collect the posted value in a variable called $item
	$itemAudioId = $_POST['audioIdDelete'];

    if ($result = $conn->query("CALL DeleteSong($itemAudioId);")) {
        echo "<table class=\"table table-striped\">";
        echo "<thead>";
        echo "<tr><th>audioId</th><th>Song Title</th><th>Artist Name</th><th>Revenue Amount</th></tr>";
        echo "</thead><tbody>";
        foreach ($result as $row) {
            echo "<tr>";
            echo "<td>" . $row["audioId"] . "</td>";
            echo "<td>" . $row["title"] . "</td>";
            echo "<td>" . $row["artist"] . "</td>";
            echo "<td>" . $row["amount"] . "</td>";
            echo "</tr>";
        }
        echo "</tbody></table>";
    } else {
        echo "Did not delete song information, make sure that the audioId passed in is valid.";
    }
    $conn->close();
    ?>
</body>