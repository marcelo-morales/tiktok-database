<head>
    <title>List the caption and sound/song used for the TikTok video that has the longest caption from all verified users</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
		integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>

<body>
    <?php
    include 'open.php';

    echo "<h2>Popular artist in TikTok with letter A</h2><br>";

    if ($result = $conn->query("CALL Query9();")) {
        echo "<table class=\"table table-striped\">";
        echo "<thead>";
        echo "<tr><th> Long caption TikTok </th></tr>";
        echo "</thead><tbody>";
        foreach ($result as $row) {
            echo "<tr>";
            echo "</tr>";
        }
        echo "</tbody></table>";
    } else {
        echo "Could not connect to the database.";
    }
    $conn->close();
    ?>
</body>