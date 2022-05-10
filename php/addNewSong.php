<head>
    <title>Adding a New Song  </title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
		integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>

<body>
    <?php
    include 'open.php';

    echo "<h2>This is the new Song that you added</h2><br>";

    // collect the posted value in a variable called $item
	$itemAudioId = $_POST['audioId'];
    $itemSongTitle = $_POST['songTitle'];
    $itemArtistName = $_POST['artistName'];
    $itemRevenueAmount = $_POST['revenueAmount'];


    if ($result = $conn->query("CALL InsertNewSong($itemAudioId, '".$itemSongTitle."', '".$itemArtistName."', $itemRevenueAmount);")) {
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
        echo "Could not connect to the database.";
    }
    $conn->close();
    ?>
</body>