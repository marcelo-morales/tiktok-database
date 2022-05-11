<head>
    <title>Albums after 2020</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
		integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>

<body>
    <?php
    include 'open.php';

    echo "<h2>TikTok videos that have a song that are part of an album that has been released after 2020 </h2><br>";

    if ($result = $conn->query("CALL Query10();")) {
        echo "<table class=\"table table-striped\">";
        echo "<thead>";
        echo "<tr><th> Album Name </th><th> Artist Name </th><th> Release Year </th><th> Studio Name </th></tr>";
        echo "</thead><tbody>";
        foreach ($result as $row) {
            echo "<tr>";
            echo "<td>".$row["albumName"]."</td>";
            echo "<td>".$row["artistName"]."</td>";
            echo "<td>".$row["releaseYear"]."</td>";
            echo "<td>".$row["studio"]."</td>";
            echo "</tr>";
        }
        echo "</tbody></table>";
    } else {
        echo "Could not connect to the database.";
    }
    $conn->close();
    ?>
</body>