<head>
    <title> Frequency of studio used to record an album that has a song used in a popular TikTok Video </title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
		integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>


    <?php
    include 'open.php';

    echo "<h2>Frequency of studio used to record an album that has a song used in a popular TikTok Video</h2><br>";

    if ($result = $conn->query("CALL Query13();")) {
        
        $dataPoints = array();
        foreach ($result as $row) {
            array_push($dataPoints, array( "label"=> $row["studio"], "y"=>  $row["COUNT(Album.studio)"]));

        }
        echo "</tbody></table>";
    } else {
        echo "Could not connect to the database.";
    }
    $conn->close();
    ?>

<html>
<head>
<script>
window.onload = function () { 
	var chart = new CanvasJS.Chart("chartContainer", {
		animationEnabled: true,
		exportEnabled: true,
		theme: "light1", // "light1", "light2", "dark1", "dark2"
		title:{
			text: "Frequency of Studio Used"
		},
		data: [{
			type: "line", //change type to column, bar, line, area, pie, etc  
			dataPoints: <?php echo json_encode($dataPoints, JSON_NUMERIC_CHECK); ?>
		}],
      axisX:{
         title:"Studio Name",
      },
      axisY:{
         title:"Number of Times Studio was used to Record an Album",
      }
	});
	chart.render(); 
}
</script>
</head>
<body>
	<div id="chartContainer" style="height: 400px; width: 100%;"></div>
	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>
</html>


<?php
    include 'open.php';

    echo "<h2>Frequency of studio used to record an album that has a song used in a popular TikTok Video</h2><br>";

    if ($result = $conn->query("CALL Query13();")) {
        echo "<table class=\"table table-striped\">";
        echo "<thead>";
        echo "<tr><th>Studio Name</th><th>Times studio has been used to record album</th></tr>";
        echo "</thead><tbody>";
        foreach ($result as $row) {
            echo "<tr>";
            echo "<td>" . $row["studio"] . "</td>";
            echo "<td>" . $row["COUNT(Album.studio)"] . "</td>";
            echo "</tr>";
        }
        echo "</tbody></table>";
    } else {
        echo "Could not connect to the database.";
    }
    $conn->close();
    ?>
