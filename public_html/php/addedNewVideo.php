<head>
    <title>Adding a New Video  </title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
		integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>

<body>
    <?php
    include 'open.php';

    echo "<h2>This is the new Video that you added</h2><br>";

    // collect the posted value in a variable called $item
	$itemVideoId = $_POST['videoId'];
    $itemUsername = $_POST['username'];
    $itemCaption = $_POST['caption'];
    $itemComments = $_POST['numComments'];
    $itemLikes = $_POST['numLikes'];


    if ($result = $conn->query("CALL InsertNewVideo($itemVideoId, '".$itemUsername."', '".$itemCaption."', '".$itemComments."', $itemLikes);")) {
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
        echo "Input is incorrect.";
    }
    $conn->close();
    ?>
</body>