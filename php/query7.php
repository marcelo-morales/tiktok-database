<head>
    <title>Average Like Count for Trending videos</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
		integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>


    <?php
    include 'open.php';

    echo "<h2>What is the average like count for profiles that had trending TikTok videos in December 2020?</h2><br>";

    if ($result = $conn->query("CALL Query7();")) {

        //will also construct an array in which we'll store our data to draw a graph
        $dataPointsOne = array();

          //will also construct an array in which we'll store our data to draw a graph
        $dataPointsTwo= array();


        foreach ($result as $row) {
          
            array_push($dataPointsOne, array( "label"=> $row["userName"], "y"=>  $row["followerCount"]));
            array_push($dataPointsTwo, array( "label"=> $row["userName"], "y"=>  $row["AVG(UserProfile.likeNumber)"]));


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
	var chart = new CanvasJS.Chart("chartContainerOne", {
		animationEnabled: true,
		exportEnabled: true,
		theme: "light1", // "light1", "light2", "dark1", "dark2"
		title:{
			text: "Follower Count for a TikTok Profile"
		},
		data: [{
			type: "line", //change type to column, bar, line, area, pie, etc  
			dataPoints: <?php echo json_encode($dataPointsOne, JSON_NUMERIC_CHECK); ?>
		}],
      axisX:{
         title:"Profile username",
      },
      axisY:{
         title:"followerCount",
      }
	});
	chart.render(); 

}

</script>
</head>
<body>
	<div id="chartContainerOne" style="height: 400px; width: 100%;"></div>
	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
    <!-- <div id="chartContainerTwo" style="height: 400px; width: 100%;"></div>
	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script> -->
</body>
</html>

<?php
    include 'open.php';


    if ($result = $conn->query("CALL Query7();")) {
        echo "<table class=\"table table-striped\">";
        echo "<thead>";
        echo "<tr><th>Username for TikTok profile</th><th>Number of followers</th><th>Average Like count</th></tr>";
        echo "</thead><tbody>";
        foreach ($result as $row) {
            echo "<tr>";
            echo "<td>".$row["username"]."</td>";
            echo "<td>".$row["followerCount"]."</td>";
            echo "<td>".$row["AVG(UserProfile.likeNumber)"]."</td>";
            echo "</tr>";
        }
        echo "</tbody></table>";
    } else {
        echo "Could not connect to the database.";
    }
    $conn->close();
    ?>