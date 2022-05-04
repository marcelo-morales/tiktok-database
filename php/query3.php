<head>
    <title>Artists that have the most trending songs from TikTok in December 2020</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
		integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>

<body>
    <?php
    include 'open.php';

    echo "<h2> Artists that have most trending songs</h2><br>";

    if ($result = $conn->query("CALL Query3();")) {
        echo "<table class=\"table table-striped\">";
        echo "<thead>";
        echo "<tr><th>Artist Name</th><th>Number of Trending Songs</th></tr>";
        echo "</thead><tbody>";
        foreach ($result as $row) {
            echo "<tr>";
            echo "<td>" . $row["artistName"] . "</td>";
            echo "<td>" . $row["frequency"] . "</td>";
            echo "</tr>";
        }
        echo "</tbody></table>";
    } else {
        echo "Could not connect to the database.";
    }
    $conn->close();
    ?>
</body>