<head>
<<<<<<< HEAD
    <title>Song from TikTok that made least amount of Revenue</title>
=======
    <title>Song that made least amount of revenue </title>
>>>>>>> 2dd18d62b805f6181e6b76937b33b6148760b9ce
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
		integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>

<body>
    <?php
    include 'open.php';

<<<<<<< HEAD
    echo "<h2>Song from TikTok that made least amount of Revenue</h2><br>";
=======
    echo "<h2>Song that made least amount of revenue</h2><br>";
>>>>>>> 2dd18d62b805f6181e6b76937b33b6148760b9ce

    if ($result = $conn->query("CALL Query1();")) {
        echo "<table class=\"table table-striped\">";
        echo "<thead>";
<<<<<<< HEAD
        echo "<tr><th>Title</th><th>Artist</th><th>Revenue</th></tr>";
=======
        echo "<tr><th>Song Title</th><th>Artist Name</th><th>Revenue Amount</th></tr>";
>>>>>>> 2dd18d62b805f6181e6b76937b33b6148760b9ce
        echo "</thead><tbody>";
        foreach ($result as $row) {
            echo "<tr>";
            echo "<td>" . $row["title"] . "</td>";
            echo "<td>" . $row["artist"] . "</td>";
<<<<<<< HEAD
            echo "<td>" . $row["Revenye"] . "</td>";
=======
            echo "<td>" . $row["Minimum_Revenue"] . "</td>";
>>>>>>> 2dd18d62b805f6181e6b76937b33b6148760b9ce
            echo "</tr>";
        }
        echo "</tbody></table>";
    } else {
        echo "Could not connect to the database.";
    }
    $conn->close();
    ?>
</body>