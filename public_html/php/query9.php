<head>
    <title>TikTok profiles with specific criteria</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
		integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>

<body>
    <?php
    include 'open.php';

    echo "<h2>Trending TikTok Profiles that have hey in their bio, are verified, and have received more than 100000 likes </h2><br>";

    if ($result = $conn->query("CALL Query9();")) {
        echo "<table class=\"table table-striped\">";
        echo "<thead>";
        echo "<tr><th> TikTok Username </th><th> User bio </th></tr>";
        echo "</thead><tbody>";
        foreach ($result as $row) {
            echo "<tr>";
            echo "<td>".$row["username"]."</td>";
            echo "<td>".$row["userBio"]."</td>";
            echo "</tr>";
        }
        echo "</tbody></table>";
    } else {
        echo "Could not connect to the database.";
    }
    $conn->close();
    ?>
</body>