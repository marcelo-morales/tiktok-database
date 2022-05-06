<head>
    <title>Average Like Count for Trending videos</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
		integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>

<body>
    <?php
    include 'open.php';

    echo "<h2>What is the average like count for profiles that had trending TikTok videos in December 2020?</h2><br>";

    if ($result = $conn->query("CALL Query7();")) {
        echo "<table class=\"table table-striped\">";
        echo "<thead>";
        echo "<tr><th>Username for TikTok profile</th><th>Number of followers</th><th>Average Like count</th></tr>";
        echo "</thead><tbody>";
        foreach ($result as $row) {
            echo "<tr>";
            echo "<td>".$row["username"]."</td>";
            echo "<td>".$row["followerCount"]."</td>";
            echo "<td>".$row["AVG(UserProfile.likeNumber)"]."</td>";
            echo "</tr>";
        }
        echo "</tbody></table>";
    } else {
        echo "Could not connect to the database.";
    }
    $conn->close();
    ?>
</body>