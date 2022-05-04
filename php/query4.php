<head>
    <title>What album has the most trending songs in TikTok in December 2020 and has been released in the past 2 years?</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
		integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>

<body>
    <?php
    include 'open.php';

    echo "<h2>Most trending album</h2><br>";

    if ($result = $conn->query("CALL Query4();")) {
        echo "<table class=\"table table-striped\">";
        echo "<thead>";
        echo "<tr><th>Most trending album in past 2 years</th></tr>";
        echo "</thead><tbody>";
        foreach ($result as $row) {
            echo "<tr>";
            echo "<td>".$row["albumName"]."</td>";
            echo "<td>".$row["frequency"]."</td>";
            echo "<td>".$row["releaseYear"]."</td>";
            echo "</tr>";
        }
        echo "</tbody></table>";
    } else {
        echo "Could not connect to the database.";
    }
    $conn->close();
    ?>
</body>