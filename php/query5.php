<head>
    <title>Which songs that are not part of an album, have just been released as singles, and have made a revenue greater than $10,000?</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
		integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>


    <?php
    include 'open.php';


    if ($result = $conn->query("CALL Query5();")) {
       
        //will also construct an array in which we'll store our data to draw a graph
        $dataPoints = array();
        foreach ($result as $row) {
            array_push($dataPoints, array( "label"=> $row["title"], "y"=>  $row["amount"]));

        }
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
			text: "Lucrative Singles that are part of a TikTok Audio"
		},
		data: [{
			type: "line", //change type to column, bar, line, area, pie, etc  
			dataPoints: <?php echo json_encode($dataPoints, JSON_NUMERIC_CHECK); ?>
		}],
      axisX:{
         title:"Song Title",
      },
      axisY:{
         title:"Revenue Amount in Dollars",
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

    echo "<h2>Which songs that are not part of an album, have just been released as singles, and have made a revenue greater than $10,000?</h2><br>";

    if ($result = $conn->query("CALL Query5();")) {
        echo "<table class=\"table table-striped\">";
        echo "<thead>";
        echo "<tr><th>Song title</th><th>Revenue amount in Dollars</th></tr>";
        echo "</thead><tbody>";
        foreach ($result as $row) {
            echo "<tr>";
            echo "<td>".$row["title"]."</td>";
            echo "<td>".$row["amount"]."</td>";
            echo "</tr>";
        }
        echo "</tbody></table>";
    } else {
        echo "Could not connect to the database.";
    }
    $conn->close();
    ?>
