<head>
    <title>Artists that have the most trending songs from TikTok in December 2020</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
		integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>


    <?php
    include 'open.php';

    echo "<h2> Artists that have most trending songs</h2><br>";

    if ($result = $conn->query("CALL Query3();")) {
        // echo "<table class=\"table table-striped\">";
        // echo "<thead>";
        // echo "<tr><th>Artist Name</th><th>Number of Trending Songs</th></tr>";
        // echo "</thead><tbody>";
        $dataPoints = array();
        foreach ($result as $row) {
            // echo "<tr>";
            // echo "<td>" . $row["artistName"] . "</td>";
            // echo "<td>" . $row["frequency"] . "</td>";
            // echo "</tr>";
            //will also construct an array in which we'll store our data to draw a graph
            
            array_push($dataPoints, array( "label"=> $row["artistName"], "y"=>  $row["frequency"]));

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
			text: "Number of Trending Songs for an Artist"
		},
		data: [{
			type: "line", //change type to column, bar, line, area, pie, etc  
			dataPoints: <?php echo json_encode($dataPoints, JSON_NUMERIC_CHECK); ?>
		}],
      axisX:{
         title:"Artist Name",
      },
      axisY:{
         title:"Number of Trending Songs",
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
            //will also construct an array in which we'll store our data to draw a graph
            $dataPoints = array();
            //array_push($dataPoints, array( "label"=> $row["artistName"], "y"=>  $row["frequency"]));

        }
        echo "</tbody></table>";
    } else {
        echo "Could not connect to the database.";
    }
    $conn->close();
    ?>