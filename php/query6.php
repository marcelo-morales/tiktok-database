<head>
    <title>Popular TikTok Videos</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
		integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>

<body>
    <?php
    include 'open.php';

    echo "<h2>Find all TikTok videos whose videos are more than the average number of likes?</h2><br>";

    if ($result = $conn->query("CALL Query6();")) {
        echo "<table class=\"table table-striped\">";
        echo "<thead>";
        echo "<tr><th>Username of TikTok Profile</th><th>Caption of TikTok Video</th><th>Number of likes on Video</th></tr>";
        echo "</thead><tbody>";
        foreach ($result as $row) {
            echo "<tr>";
            echo "<td>".$row["username"]."</td>";
            echo "<td>".$row["caption"]."</td>";
            echo "<td>".$row["likeCount"]."</td>";
            echo "</tr>";
        }
        echo "</tbody></table>";
    } else {
        echo "Could not connect to the database.";
    }
    $conn->close();
    ?>
</body>