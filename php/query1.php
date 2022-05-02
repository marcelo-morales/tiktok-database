<head>
    <title>Song from TikTok that made least amount of Revenue</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
		integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>

<body>
    <?php
    include 'open.php';

    echo "<h2>Song from TikTok that made least amount of Revenue</h2><br>";

    if ($result = $conn->query("CALL Query1();")) {
        echo "<table class=\"table table-striped\">";
        echo "<thead>";
        echo "<tr><th>Title</th><th>Artist</th><th>Revenue</th></tr>";
        echo "</thead><tbody>";
        foreach ($result as $row) {
            echo "<tr>";
            echo "<td>" . $row["title"] . "</td>";
            echo "<td>" . $row["artist"] . "</td>";
            echo "<td>" . $row["Revenye"] . "</td>";
            echo "</tr>";
        }
        echo "</tbody></table>";
    } else {
        echo "Could not connect to the database.";
    }
    $conn->close();
    ?>
</body>