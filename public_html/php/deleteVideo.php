<head>
    <title>Deleting a Video </title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
		integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>

<body>
    <?php
    include 'open.php';

    echo "<h2>Will retrieve all videos and will see that your video is not found</h2><br>";

      // collect the posted value in a variable called $item
	$itemVideoId = $_POST['videoIdDelete'];

    if ($result = $conn->query("CALL DeleteVideo($itemVideoId);")) {
        echo "<table class=\"table table-striped\">";
        echo "<thead>";
        echo "<tr><th>videoId</th><th>Username</th><th>Caption</th><th>Number of Comments</th><th>Number of Likes</th></tr>";
        echo "</thead><tbody>";
        foreach ($result as $row) {
            echo "<tr>";
            echo "<td>" . $row["videoId"] . "</td>";
            echo "<td>" . $row["username"] . "</td>";
            echo "<td>" . $row["caption"] . "</td>";
            echo "<td>" . $row["commentCount"] . "</td>";
            echo "<td>" . $row["likeCount"] . "</td>";
            echo "</tr>";
        }
        echo "</tbody></table>";
    } else {
        echo "Deletion did not work, make sure videoId is valid";
    }
    $conn->close();
    ?>
</body>