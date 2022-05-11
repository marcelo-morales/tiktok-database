<head>
    <title>Popular TikTok Videos</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
		integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>


    <?php
    include 'open.php';

    echo "<h2>Find all TikTok videos whose videos are more than the average number of likes?</h2><br>";

    if ($result = $conn->query("CALL Query6();")) {
       //will also construct an array in which we'll store our data to draw a graph
       $dataPoints = array();
        foreach ($result as $row) {
           
            array_push($dataPoints, array( "label"=> $row["username"], "y"=>  $row["likeCount"]));

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
			text: "Likes for a TikTok Profile"
		},
		data: [{
			type: "line", //change type to column, bar, line, area, pie, etc  
			dataPoints: <?php echo json_encode($dataPoints, JSON_NUMERIC_CHECK); ?>
		}],
      axisX:{
         title:"TikTok username",
      },
      axisY:{
         title:"Like Count",
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

    echo "<h2>Find all TikTok videos whose videos are more than the average number of likes?</h2><br>";

    if ($result = $conn->query("CALL Query6();")) {
        echo "<table class=\"table table-striped\">";
        echo "<thead>";
        echo "<tr><th>Username of TikTok Profile</th><th>Caption of TikTok Video</th><th>Number of likes on Video</th></tr>";
        echo "</thead><tbody>";
        foreach ($result as $row) {
            echo "<tr>";
            echo "<td>".$row["username"]."</td>";
            echo "<td>".$row["caption"]."</td>";
            echo "<td>".$row["likeCount"]."</td>";
            echo "</tr>";
        }
        echo "</tbody></table>";
    } else {
        echo "Could not connect to the database.";
    }
    $conn->close();
    ?>
