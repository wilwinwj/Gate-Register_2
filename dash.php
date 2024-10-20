<?php
	include "./process/operations/main.php";
	include "./process/operations/stats.php";
	$title = "Gate Register";
	$acc_code = "U02";
	if(!isset($_SESSION['id']) && empty($_SESSION['id'])) {
   header("location:login.php");
	}
	require "./functions/access.php";
	require_once "./template/header.php";
	require "functions/dbfunc.php";

  $loc = $_SESSION['loc'];

  $new_arrivals = false;
  $quote = false;
  $clock = false;
  $banner = false;

  $banner = $_SESSION["banner"];
  $activedash = $_SESSION["activedash"];

  if($banner == "true"){
  	$banner = true;
  }elseif($banner == "false"){
  	$banner = false;
  }

  if($activedash == 'clock'){
  	$clock = true;
  }elseif($activedash == 'quote'){
  	$quote = true;
  }elseif($activedash == 'newarrivals'){
  	$new_arrivals = true;
  }else{
  	$new_arrivals = false;
	  $quote = false;
	  $clock = false;
  }

	$data = checknews($conn, $loc);
	if($data){
		$news = true;
		$new_arrivals = false;
	  $quote = false;
	  $clock = false;
	  $banner = false;
	}else{
		$news = false;
	}

 $img_flag = true;
	if(!$e_img){
		$img_flag = false;
	}

	$jsonfile = file_get_contents("assets/quotes.json");
  $quotes = json_decode($jsonfile, true);
  $onequote = $quotes[rand(0, count($quotes) - 1)];
?>
<body style="background-color: #F1EADE;"> 
<a href="login.php" class="btn btn-danger btn-fab btn-round" style="position: fixed; top: 20px; right: 80px; z-index: 999;">
    <i class="material-icons">exit_to_app</i>
</a>

<a href="dash.php" class="btn btn-primary btn-fab btn-round" style="position: fixed; top: 20px; right: 20px; z-index: 999;">
    <i class="material-icons">home</i>
</a>

    </a>
<!-- MAIN CONTENT START -->
<div class="content" style="min-height: calc(100vh - 90px);">
	<div class="container-fluid">
	  <div class="row">
	    <div class="col-md-6">
	    	<div class="card" style="min-height: calc(100vh - 150px);">
	        <div class="card-body">
	        	<?php if($banner) { ?>
							<img class="img-responsive" src="assets/img/banner.png">
						<?php }else{ ?>
							<h3 class="text-center"><?php echo $_SESSION['lib']; ?></h3>
	        	<?php } ?>
	        <?php if($news) { ?>
	        	<div class="card-block">
							<div class="card-title text-info h4 text-center">
								 <?php echo "<br/>".$data['nhead']; ?> 
							</div>		        
							<div class="h4 text-center" style="text-align: justify !important;">
								 <?php echo "<br/>".nl2br($data['nbody']); ?> 
							</div>
							<div class="h4 text-success text-center">
						 		<?php echo "<br/>".$data['nfoot']; ?> 
							</div>
						</div>
					<?php } ?>
					<?php if($new_arrivals) { ?>
						<h3 class="text-center">New Arrivals</h3>
						<div class="new-arrivals">
							<img src="assets/books/1.png"> 
							<img src="assets/books/2.png">
							<img src="assets/books/3.png">
							<img src="assets/books/4.png">
						</div>
						<div class="new-arrivals">
							<img src="assets/books/5.png">
							<img src="assets/books/6.png"> 
							<img src="assets/books/7.png">
							<img src="assets/books/8.png">
						</div>
					<?php } ?>
					<?php if($quote) { ?>
						<div class="card-block2" style="min-height: calc(100vh - 430px);">
							<div class="qcard">
							  <div class="qcontent">
							    <h3 class="qsub-heading">Quote for the thought</h3>
							    <blockquote>
								    <h1 class="qheading"><?php echo $onequote["content"]; ?></h1>
								    <p class="qcaption"><strong><?php echo $onequote["author"]; ?></strong></p>
							  	</blockquote>
							  </div>
							</div>
						</div>
					<?php } ?>
					<?php if($clock) { ?>
						<div class="card-body">
							<div class="analogclock">
							  <div>
							    <div class="cinfo cdate"></div>
							    <div class="cinfo cday"></div>
							  </div>
							  <div class="cdot"></div>
							  <div>
							    <div class="chour-hand"></div>
							    <div class="cminute-hand"></div>
							    <div class="csecond-hand"></div>
							  </div>
							  <div id="dial">
							    <span class="n3">3</span>
							    <span class="n6">6</span>
							    <span class="n9">9</span>
							    <span class="n12">12</span>
							  </div>
							  <div class="cdiallines"></div>
							</div>
						</div>
					<?php } ?>
	        </div>
	      </div>
	    </div>
	    <div class="col-md-6 text-center" style="margin-top: 24px;">
	    	<div>
		    	<h2>Gate Register</h2>
		    	<h3><?php echo $_SESSION['locname']; ?></h3>
		    	<form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="GET">
		        <input type="text" name="id" id="usn" class="" value="" autofocus="true">
					</form>
		    </div>
	    	<?php
	    		if(isset($d_status)){
	    	?>
	    	<div class="card-body text-center">
	    		<?php if($img_flag) { ?>
	    			<img src="data:image/jpg/png/jpeg;base64,<?php echo base64_encode($e_img); ?>"  class="rounded-circle mb-4" alt="...">
		    	<?php } else { ?>
		    		<img src="assets/img/placeholder.png" class="rounded-circle mb-4" alt="...">
		    	<?php } ?>
					<h4 class="mb-0" style="font-weight: 800;"><?php echo $e_name; ?></h4>
					<p class="mb-2"><?php echo $usn; ?></p>
				</div>
				<?php
					}
				?>
		    <div class="h1 t-shadow">
					<?php
						if ($d_status == "OUT") {
						    echo "<span class='status-inout text-danger animated flash'>OUT</span>";
						} elseif ($d_status == "IN") {
						    echo "<span class='status-inout text-success animated flash'>IN</span>";
						}
					?>
				</div>
				<div class="h2 t-shadow">
					<?php
						if ($msg == "1") {
							?> <span class="animated flash"> <?php 
						    echo "<span class='text-primary'>Your ".$_SESSION['noname']." is: " . $usn . "<br>Entry time is: " . date('g:i A', strtotime($time))."</span>";
						    ?> </span> <?php
						} elseif ($msg == "2") {
						    # code...
						    ?> <span class="animated flash"> <?php 
						    echo "<span class='text-warning'>You just Checked In.<br> Wait for 10 Seconds to Check Out.</span>";
						    ?> </span> <?php
						} elseif ($msg == "3") {
						    # code...
						    ?> <span class="animated flash"> <?php 
						    echo "<span class='text-danger'>Invalid or Expired ".$_SESSION['noname']."<br> Contact Librarian for more details.</span>";
						    ?> </span> <?php
						} elseif ($msg == "4") {
						    # code...
						    ?> <span class="animated flash"> <?php 
						    echo "<span class='text-success'>Your Exit time is: " . date('g:i A', strtotime($time)) . "<br><span class='text-warning'>Total Time Duration : ".$otime[0]."</span>";
						    ?> </span> <?php
						} elseif ($msg == "5") {
						    # code...
						    ?> <span class="animated flash"> <?php 
						    echo "<span class='text-info'>You just Checked Out.<br> Wait for 10 Seconds to Check In.</span>";
						    ?> </span> <?php
						} else { ?> 
							<div class="idle">
								<div class="animated pulse infinite"> 
							    <span class='text-info'>SCAN YOUR ID CARD</span>
							  </div>
							  <div class="row">
									<div class="col-md-3">
				            <div class="card card-stats">
				              <div class="card-header card-header-info card-header-icon">
				                <div class="card-icon">
				                </div>
				                <p class="card-category">Boys</p>
				                <h3 class="card-title"><?php echo $male[0]; ?></h3>
				              </div>
				              <div class="card-footer">
				                <div class="stats">
				                  <i class="material-icons">update</i> Just Updated
				                </div>
				              </div>
				            </div>
				          </div>
				          <div class="col-md-3">
				            <div class="card card-stats">
				              <div class="card-header card-header-rose card-header-icon">
				                <div class="card-icon">
				                </div>
				                <p class="card-category">Girls</p>
				                <h3 class="card-title"><?php echo $female[0]; ?></h3>
				              </div>
				              <div class="card-footer">
				                <div class="stats">
				                  <i class="material-icons">update</i> Just Updated
				                </div>
				              </div>
				            </div>
				          </div>
				          <div class="col-md-3">
				            <div class="card card-stats">
				              <div class="card-header card-header-success card-header-icon">
				                <div class="card-icon">
				                </div>
				                <p class="card-category">Checked In</p>
				                <h3 class="card-title"><?php echo $tin[0]; ?></h3>
				              </div>
				              <div class="card-footer">
				                <div class="stats">
				                  <i class="material-icons">update</i> Just Updated
				                </div>
				              </div>
				            </div>
				          </div>
				          <div class="col-md-3">
				            <div class="card card-stats">
				              <div class="card-header card-header-warning card-header-icon">
				                <div class="card-icon">
				                </div>
				                <p class="card-category">Day Count</p>
				                <h3 class="card-title"><?php echo $visit[0]; ?></h3>
				              </div>
				              <div class="card-footer">
				                <div class="stats">
				                  <i class="material-icons">update</i> Just Updated
				                </div>
				              </div>
				            </div>
				          </div>
								</div>
							</div>
					<?php
						}
					?>
				</div>
	    </div>
	  </div>              
	</div>
</div>
<script src="assets/js/analogclock.js"></script>
<script type="text/javascript">
	$('span').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend');
	document.querySelector('.btn-danger').addEventListener('click', function() {
            // Redirect to the login page when the logout button is clicked
            window.location.href = 'login.php';
	})
	  
</script>
<!-- MAIN CONTENT ENDS -->
<?php
	require_once "./template/footer.php";
?>	