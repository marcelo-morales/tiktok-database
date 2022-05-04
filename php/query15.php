<head>
    <title>For the artist who made the most revenue from TikTok videos in December 2020, list the song title, artist name
 and revenue amount, sorted in highest to lowest revenue amount if the artist has released multiple songs </title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
		integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>

<body>
    <?php
    include 'open.php';

    echo "<h2>Information about the most lucrative TIkTok musical artist</h2><br>";

    if ($result = $conn->query("CALL Query15();")) {
        echo "<table class=\"table table-striped\">";
        echo "<thead>";
        echo "<tr><th>Song Title</th><th>Artist Name</th><th>Revenue Amount</th></tr>";
        echo "</thead><tbody>";
        foreach ($result as $row) {
            echo "<tr>";
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