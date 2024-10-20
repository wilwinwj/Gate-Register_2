	<?php
	session_start();
	// ob_start(ob_gzhandler);
	$title = "Report";
	$acc_code = "R01";
	$table = true;
	require "./functions/access.php";
	require_once "./template/header.php";
	require_once "./template/sidebar.php";
	require "functions/dbconn.php";
	require "functions/dbfunc.php";
	require "functions/general.php";	
	$slib = $_SESSION['loc'];
	$cname = $_SESSION["lib"];
?>
<!-- MAIN CONTENT START -->
<?php
	if (isset($_POST['datewiseRep'])) {
		$title = "Date wise Reports";
		$ftime = $_POST['ftime'];
	  $ttime = $_POST['ttime'];
	  $fdate = $_POST['fdate'];
	  $fdate = str_replace('/', '-', $fdate);
	  $fdate = date("Y-m-d", strtotime($fdate));
	  $tdate = $_POST['tdate'];
	  $tdate = str_replace('/', '-', $tdate);
	  $tdate = date("Y-m-d", strtotime($tdate));
	  if ($ftime == NULL) {
	      $ftime = "00:00:00";
	  }else{
	  	$ftime = date("H:i:s", strtotime($ftime));
	  }
	  if ($ttime == NULL) {
	      $ttime = "23:59:59";
	  }else{
	  	$ttime = date("H:i:s", strtotime($ttime));
	  }

	  if($slib == "Master"){
      $sql = "SELECT count(sl)  FROM `inout` where (entry between '$ftime' and '$ttime') and (date between '$fdate' and '$tdate') and gender='Male'";
    }else{
      $sql = "SELECT count(sl)  FROM `inout` where (entry between '$ftime' and '$ttime') and (date between '$fdate' and '$tdate') and gender='Male' and `loc`='$slib'";
    }
    $result = mysqli_query($conn, $sql) or die("Invalid query: " . mysqli_error($conn));
    $male = mysqli_fetch_row($result);
    if($slib == "Master"){
      $sql = "SELECT count(sl)  FROM `inout` where (entry between '$ftime' and '$ttime') and (date between '$fdate' and '$tdate') and gender='Female'";
    }else{
      $sql = "SELECT count(sl)  FROM `inout` where (entry between '$ftime' and '$ttime') and (date between '$fdate' and '$tdate') and gender='Female' and `loc`='$slib'";
    }
    $result = mysqli_query($conn, $sql) or die("Invalid query: " . mysqli_error($conn));
    $female = mysqli_fetch_row($result);
    if($slib == "Master"){
      $sql = "SELECT count(sl)  FROM `inout` where (entry between '$ftime' and '$ttime') and (date between '$fdate' and '$tdate')";
    }else{
      $sql = "SELECT count(sl)  FROM `inout` where (entry between '$ftime' and '$ttime') and (date between '$fdate' and '$tdate') and `loc`='$slib'";
    }
    $result = mysqli_query($conn, $sql) or die("Invalid query: " . mysqli_error($conn));
    $visit = mysqli_fetch_row($result);

	  if($slib == "Master"){
	    $sql = "SELECT *  FROM `inout` where (entry between '$ftime' and '$ttime') and (date between '$fdate' and '$tdate')";
	  }else{
	    $sql = "SELECT *  FROM `inout` where (entry between '$ftime' and '$ttime') and (date between '$fdate' and '$tdate') and `loc`='$slib'";
	  }
	  $result = mysqli_query($conn, $sql) or die("Invalid query: " . mysqli_error($conn));
	}

	if (isset($_POST['studentRep'])) {
    $usn = strtoupper($_POST['usn']);
    $title = "Report For USN: ".$usn;
    $fdate = $_POST['fdate'];
    $fdate = str_replace('/', '-', $fdate);
	  $fdate = date("Y-m-d", strtotime($fdate));
    $tdate = $_POST['tdate'];
    $tdate = str_replace('/', '-', $tdate);
	  $tdate = date("Y-m-d", strtotime($tdate));
	  $flag = $_POST['rtype'];

	  if (isset($_POST['studentRep'])) {
		$usn = strtoupper($_POST['usn']);
		$title = "Report For USN: " . $usn;
		$fdate = $_POST['fdate'];
		$fdate = str_replace('/', '-', $fdate);
		$fdate = date("Y-m-d", strtotime($fdate));
		$tdate = $_POST['tdate'];
		$tdate = str_replace('/', '-', $tdate);
		$tdate = date("Y-m-d", strtotime($tdate));
		$flag = $_POST['rtype'];
		if ($flag == "Short") {
			if ($slib == "Master") {
				$sql = "SELECT cardnumber, name, branch, SUM(TIME_TO_SEC(SUBTIME(`exit`, `entry`))) as total_hours
						FROM `inout`
						WHERE `date` BETWEEN '$fdate' AND '$tdate'
						GROUP BY cardnumber
						ORDER BY total_hours DESC
						LIMIT 20";
			} else {
				$sql = "SELECT cardnumber, name, branch, SUM(TIME_TO_SEC(SUBTIME(`exit`, `entry`))) as total_hours
						FROM `inout`
						WHERE (`date` BETWEEN '$fdate' AND '$tdate') AND `loc`='$slib'
						GROUP BY cardnumber
						ORDER BY total_hours DESC
						LIMIT 20";
			}
			
			$result = mysqli_query($conn, $sql) or die("Invalid query: " . mysqli_error($conn));
			
			// Display the results
			echo '<div class="col-md-6 ml-auto mr-auto">
					<div class="card">
					  <div class="card-header card-header-info card-header-icon">
						<div class="card-icon">
						  <i class="material-icons">assignment</i>
						</div>
						<h4 class="card-title">' . $title . '</h4>
					  </div>
					  <div class="card-body">
						<table id="datatables" class="table table-striped table-no-bordered table-hover" cellspacing="0" width="100%" style="width:100%">
						  <thead>
							<tr>
							  <th>USN</th>  
							  <th>Name</th>
							  <th>Branch</th>
							  <th>Total Hours Spent</th>
							</tr>
						  </thead>
						  <tbody>';
				
					
			while ($row = mysqli_fetch_assoc($result)) {
				echo '<tr>
						<td>' . $row['cardnumber'] . '</td>
						<td>' . $row['name'] . '</td>
						<td>' . $row['branch'] . '</td>
						<td>' . gmdate("H:i:s", $row['total_hours']) . '</td>
					  </tr>';
			}
			echo "<script type='text/javascript'>var printMsg = '".$_SESSION['lib']." Detailed Inout System Report for ".$usn." From ".$fdate." To ".$tdate."';</script>";
			while ($row = mysqli_fetch_array($result)) {
			  echo'<tr>
				<td>'. $row['cardnumber'].'</td>
				<td>'.$row['name'].'</td>
				<td>'. $row['branch'].'</td>
				<td>'. $row['Total time spend'].'</td>
			  </tr>';
	  
			}
			
			echo '</tbody>
				  </table>
				</div>
			  </div>
			</div>';
			
	
			echo '</tbody>
				  </table>
				</div>
			  </div>
			</div>';
		}
	}
	

	  if($flag == "Detail"){
	  	if($slib=="Master"){
      	$sql = "SELECT date, SUBTIME(`exit`,`entry`), `exit`, `entry`, DAYNAME(`DATE`), `loc`  FROM `inout` WHERE `cardnumber`='$usn' AND `date` between '$fdate' and '$tdate'";
      }else{
      	$sql = "SELECT date, SUBTIME(`exit`,`entry`), `exit`, `entry`, DAYNAME(`DATE`), `loc`  FROM `inout` WHERE `cardnumber`='$usn' AND (`date` between '$fdate' and '$tdate') and `loc`='$slib'";
      }
      $result = mysqli_query($conn, $sql) or die("Invalid query: " . mysqli_error($conn));
	  } //end of detail report

	}

	if (isset($_POST['statRep'])) {
		$fdate = $_POST['fdate'];
    $fdate = str_replace('/', '-', $fdate);
	  $fdate = date("Y-m-d", strtotime($fdate));
    $tdate = $_POST['tdate'];
    $tdate = str_replace('/', '-', $tdate);
	  $tdate = date("Y-m-d", strtotime($tdate));
	  $idate = $fdate;
	}


?>
<div class="content" style="min-height: calc(100vh - 160px);">
	<div class="container-fluid">
	  <div class="row">
    	<?php
    		if (isset($_POST['datewiseRep'])) {
    	?>
    	<div class="col-md-12">
	    	<div class="card">
				  <div class="card-header card-header-info card-header-icon">
				    <div class="card-icon">
				      <i class="material-icons">assignment</i>
				    </div>
				    <h4 class="card-title"><?php echo $title; ?></h4>
				  </div>
				  <div class="card-body">
				  	<table id="datatables" class="table table-striped table-no-bordered table-hover" cellspacing="0" width="100%" style="width:100%">
			        <thead>
			          <tr>
	                <th>USN</th>  
	                <th>Name</th>
	                <th>Date</th>  
	                <th>Entry</th>
	                <th>Exit</th>
	                <th>Loaction</th>
	                <th>Category</th>
	                <th>Branch</th>
			          </tr>
			        </thead>
			        <tbody>
			        	<?php
			        		echo "<script type='text/javascript'>var printMsg = '".$_SESSION['lib']." Datewise Inout System Report From ".$fdate." To ".$tdate."';</script>";
	                while ($row = mysqli_fetch_array($result)) {
	              ?>
	              	<tr>
	                  <td><?php echo $row['cardnumber']; ?></td>
	                  <td><?php echo $row['name']; ?></td>
	                  <td><?php echo $row['date']; ?></td>
	                	<td><?php echo $row['entry']; ?></td>
	                	<td><?php echo $row['exit']; ?></td>
	                	<td><?php echo $row['loc']; ?></td>
	                	<td><?php echo $row['cc']; ?></td>
	                	<td><?php echo $row['branch']; ?></td>
	                </tr>
	              <?php
	                } //while end
			        	?>
			        	<tr>
			        		<td>Total</td>
			        		<td><?php echo $visit[0]; ?></td>
			        		<td>Male</td>
			      			<td><?php echo $male[0]; ?></td>
			   					<td>Female</td>
			   					<td><?php echo $female[0]; ?></td>
			   					<td></td>
			   					<td></td>
			   				</tr>
			        </tbody>
			        <tfoot>
		            <tr>
	                <th></th>
	                <th></th>
	                <th></th>
	                <th></th>
	                <th></th>
	                <th></th>
	                <th></th>
	                <th></th>
		            </tr>
		        	</tfoot>
			      </table>
				  </div>
				</div>
			</div>
			<?php
				} //end of studentwise short report
				if ($flag == "Detail") {
			?>
				<div class="col-md-12">
					<div class="card">
					  <div class="card-header card-header-info card-header-icon">
					    <div class="card-icon">
					      <i class="material-icons">assignment</i>
					    </div>
					    <h4 class="card-title">Detailed <?php echo $title; ?></h4>
					  </div>
					  <div class="card-body">
					  	<table id="datatables" class="table table-striped table-no-bordered table-hover" cellspacing="0" width="100%" style="width:100%">
				        <thead>
				          <tr>
		                <th>Date</th>  
		                <th>Day</th>
		                <th>Entry</th>  
		                <th>Exit</th>
		                <th>Total Time</th>
		                <th>Location</th>
				          </tr>
				        </thead>
				        <tbody>
				        	<?php
				        		echo "<script type='text/javascript'>var printMsg = '".$_SESSION['lib']." Detailed Inout System Report for ".$usn." From ".$fdate." To ".$tdate."';</script>";
		                while ($row = mysqli_fetch_array($result)) {
		              ?>
		              	<tr>
		                  <td><?php echo $row[0]; ?></td>
		                  <td><?php echo $row[4]; ?></td>
		                  <td><?php echo $row[3]; ?></td>
		                	<td><?php echo $row[2]; ?></td>
		                	<td><?php echo $row[1]; ?></td>
		                	<td><?php echo $row[5]; ?></td>
		                </tr>
		              <?php
		                } //while end
				        	?>
				        </tbody>
				        <tfoot>
			            <tr>
		                <th></th>
		                <th></th>
		                <th></th>
		                <th></th>
		                <th></th>
		                <th></th>
			            </tr>
			        	</tfoot>
				      </table>
					  </div>
					</div>
				</div>
			<?php
				} //end of studentwise Detailed report
				if (isset($_POST['statRep'])) {
			?>
				<div class="col-md-8 ml-auto mr-auto">
					<div class="card">
					  <div class="card-header card-header-info card-header-icon">
					    <div class="card-icon">
					      <i class="material-icons">assignment</i>
					    </div>
					    <h4 class="card-title">Statistical Reports</h4>
					  </div>
					  <div class="card-body">
					  	<table id="datatables" class="table table-striped table-no-bordered table-hover" cellspacing="0" width="100%" style="width:100%">
				        <thead>
				          <tr>
		                <th>Date</th>  
		                <th>Day</th>
		                <th>Male</th>  
		                <th>Female</th>
		                <th>Visits</th>
		                <th>Location</th>
				          </tr>
				        </thead>
				        <tbody>
				        	<?php
				        		echo "<script type='text/javascript'>var printMsg = '".$_SESSION['lib']." Statistical Inout System Report From ".$fdate." To ".$tdate."';</script>";

				        		if($slib=="Master"){
                      $query = "SELECT * FROM `loc`";
                      $res = mysqli_query($conn, $query) or die("Invalid Query:".mysqli_error($conn));
                      while($row=mysqli_fetch_array($res)){
                        do{
                          $sql = "SELECT count(sl), DAYNAME('$idate') FROM `inout` WHERE `date` = '$idate' AND `gender`='Male' AND `loc`='$row[1]'";
                          $result = mysqli_query($conn, $sql) or die("Invalid query1: " . mysqli_error($conn));
                          $male = mysqli_fetch_row($result);
                          $sql = "SELECT count(sl)  FROM `inout` WHERE `date` = '$idate' AND `gender`='Female' AND `loc`='$row[1]'";
                          $result = mysqli_query($conn, $sql) or die("Invalid query2: " . mysqli_error($conn));
                          $female = mysqli_fetch_row($result);
                          $sql = "SELECT count(sl)  FROM `inout` WHERE `date` = '$idate' AND `loc`='$row[1]'";
                          $result = mysqli_query($conn, $sql) or die("Invalid query3: " . mysqli_error($conn));
                          $visit = mysqli_fetch_row($result);
                          if($visit[0] != '0'){
                          	echo "<tr><td>".$idate."</td><td> ".$male[1]."</td><td>".$male[0]." </td><td>".$female['0']."</td><td> ".$visit['0']."</td><td>".$row[1]."</td></tr>"; 
                          }
                          $idate=date_create("$idate");
                          date_add($idate,date_interval_create_from_date_string("1 days"));
                          $idate = date_format($idate,"Y-m-d");
                        }while ($idate<=$tdate);
                        $idate=$fdate;
	                    }
	                  }else{
	                    do{
	                      $sql = "SELECT count(sl), DAYNAME('$idate') FROM `inout` WHERE `date` = '$idate' AND `gender`='Male' AND `loc`='$slib'";
	                      $result = mysqli_query($conn, $sql) or die("Invalid query1: " . mysqli_error($conn));
	                      $male = mysqli_fetch_row($result);
	                      $sql = "SELECT count(sl)  FROM `inout` WHERE `date` = '$idate' AND `gender`='Female' AND `loc`='$slib'";
	                      $result = mysqli_query($conn, $sql) or die("Invalid query2: " . mysqli_error($conn));
	                      $female = mysqli_fetch_row($result);
	                      $sql = "SELECT count(sl)  FROM `inout` WHERE `date` = '$idate' AND `loc`='$slib'";
	                      $result = mysqli_query($conn, $sql) or die("Invalid query3: " . mysqli_error($conn));
	                      $visit = mysqli_fetch_row($result);
	                      if($visit[0] != '0'){
	                      	echo "<tr><td>".$idate."</td><td> ".$male[1]."</td><td>".$male[0]." </td><td>".$female['0']."</td><td> ".$visit['0']."</td><td>".$_SESSION['loc']."</td></tr>"; 
	                    	}
	                      $idate=date_create("$idate");
	                      date_add($idate,date_interval_create_from_date_string("1 days"));
	                      $idate = date_format($idate,"Y-m-d");
	                    }while ($idate<=$tdate);
	                  }

	                  if($slib=="Master"){
                      $sql = "SELECT count(sl)  FROM `inout` where (date between '$fdate' and '$tdate') and gender='Male'";
                    }else{
                      $sql = "SELECT count(sl)  FROM `inout` where (date between '$fdate' and '$tdate') and gender='Male' and `loc`='$slib'";
                    }
                    $result = mysqli_query($conn, $sql) or die("Invalid query: " . mysqli_error($conn));
                    $male = mysqli_fetch_row($result);
                    if($slib=="Master"){
                      $sql = "SELECT count(sl)  FROM `inout` where (date between '$fdate' and '$tdate') and gender='Female'";
                    }else{
                      $sql = "SELECT count(sl)  FROM `inout` where (date between '$fdate' and '$tdate') and gender='Female' and `loc`='$slib'";
                    }
                    $result = mysqli_query($conn, $sql) or die("Invalid query: " . mysqli_error($conn));
                    $female = mysqli_fetch_row($result);
                    if($slib=="Master"){
                      $sql = "SELECT count(sl)  FROM `inout` where (date between '$fdate' and '$tdate')";
                    }else{
                      $sql = "SELECT count(sl)  FROM `inout` where (date between '$fdate' and '$tdate') and `loc`='$slib'";
                    }
                    $result = mysqli_query($conn, $sql) or die("Invalid query: " . mysqli_error($conn));
                    $visit = mysqli_fetch_row($result);
                    echo "<tr><td> Total </td><td> - </td><td> " . $male[0] . " </td><td> " . $female[0] . "</td><td> " . $visit[0] . "</td><td> - </td></tr>";
		              ?>
				        </tbody>
				        <tfoot>
			            <tr>
		                <th></th>
		                <th></th>
		                <th></th>
		                <th></th>
		                <th></th>
		                <th></th>
			            </tr>
			        	</tfoot>
				      </table>
					  </div>
					</div>
				</div>
			<?php
				} //end of statistaical reports
			?>
			
	  </div>              
	</div>
</div>
<!-- MAIN CONTENT ENDS -->
<?php
	require_once "./template/footer.php";
	// ob_end_flush();
?>