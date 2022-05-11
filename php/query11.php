<head>
    <title>FYP in TikTok Video caption</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
		integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>

<body>
    <?php
    include 'open.php';

    echo "<h2>Trending TikTok video that have a for you hashtag in their caption and have likes more 1000000 likes  </h2><br>";

    if ($result = $conn->query("CALL Query11();")) {
        echo "<table class=\"table table-striped\">";
        echo "<thead>";
        echo "<tr><th> TikTok videoId </th><th> Caption </th></tr>";
        echo "</thead><tbody>";
        foreach ($result as $row) {
            echo "<tr>";
            echo "<td>".$row["videoId"]."</td>";
            echo "<td>".$row["caption"]."</td>";
            echo "</tr>";
        }
        echo "</tbody></table>";
    } else {
        echo "Could not connect to the database.";
    }
    $conn->close();
    ?>
</body>