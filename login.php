<html lang="en" class="perfect-scrollbar-off">
<head>
  <?php
    include './functions/dbconn.php';
  ?>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title>Login</title>
  <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no" name="viewport">
  <link href="assets/css/material-icons.css" rel="stylesheet">
  <link href="assets/css/material-dashboard.min.css" rel="stylesheet">
  <link href="assets/css/custom.css" rel="stylesheet">
  <link href="assets/css/font-awesome.min.css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="assets/css/bootstrap-select.min.css">
  <script src="assets/js/core/jquery.min.js" type="text/javascript"></script>
  <script src="assets/js/custom.js" type="text/javascript"></script>
  <script src="assets/js/plugins/bootstrap-notify.js"></script>
  <style>
    .background-overlay {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background-color: rgba(0, 0, 0, 0);
      transition: background-color 0.5s ease; /* Add transition property */
    }

    .page-header {
      position: relative;
    }
  </style>
  <?php
    date_default_timezone_set("Asia/Kolkata");
  ?>
</head>
<body class="off-canvas-sidebar" cz-shortcut-listen="true">
  <div class="wrapper wrapper-full-page">
    <div class="page-header login-page header-filter" filter-color="black" style="background-image: url('assets/img/login.jpg'); background-size: cover; background-position: top center;">
      <!-- Background overlay div -->
      <div class="background-overlay"></div>
      <img src="K.png" alt="KSREI" style="width: 400px; height: 150px; margin-right: 10px; position: absolute; top: 0; left: 0;">
      <div class="container">
        <div class="col-lg-4 col-md-6 col-sm-6 ml-auto mr-auto">
          <div class="text-center" style="margin-top: 0px;">
            <h1 style="color: white;">KSRCAS(Autonomus) LMS</h1>
            <form class="form" method="POST" action="login_verify.php">
              <div class="card card-login">
                <div class="card-header card-header-rose text-center">
                  <h3 class="card-title">Login</h3>
                  <div class="social-line">
                    <i class="material-icons md-36" style="margin-left: 38px;">fingerprints</i>
                  </div>
                </div>
                <div class="card-body">
                  <p class="card-description text-center"></p>
                  <span class="bmd-form-group">
                    <div class="input-group">
                      <div class="input-group-prepend">
                        <span class="input-group-text">
                          <i class="material-icons">face</i>
                        </span>
                      </div>
                      <input type="text" name="name" class="form-control" autofocus="" required="" placeholder="Username">
                    </div>
                  </span>
                  <span class="bmd-form-group">
                    <div class="input-group">
                      <div class="input-group-prepend">
                        <span class="input-group-text">
                          <i class="material-icons">lock_outline</i>
                        </span>
                      </div>
                      <input type="password" name="pass" class="form-control" required="" placeholder="Password">
                    </div>
                  </span>
                  <span class="bmd-form-group">
                    <div class="input-group">
                      <div class="input-group-prepend">
                        <span class="input-group-text">
                          <i class="material-icons">my_location</i>
                        </span>
                      </div>
                      <select name="loc" required="" class="selectpicker" data-style="select-with-transition" title="Select Location">
                        <?php
                          $query = "SELECT * FROM loc";
                          $res = mysqli_query($conn, $query) or die("Invalid Query:".mysqli_error($conn));
                          while($row = mysqli_fetch_array($res)){
                            echo "<option>".$row[1]."</option>";
                          }
                        ?>
                        <option value="Master">Master</option>
                      </select>
                    </div>
                  </span>
                </div>
                <div class="card-footer justify-content-center">
                  <input type="submit" value="Login" name="submit" class="btn btn-rose btn-link btn-lg">
                </div>
              </div>
            </form>
          </div>
        </div>
        <footer class="footer">
          <div class="container">
            <nav class="float-left footer-menu">
              <!-- Footer content here -->
            </nav>
            <footer>
              <h3>Developed by Department of Data Science</h3>
            </footer>
          </div>
        </footer>
      </div>
    </div>
    <!--   Core JS Files   -->
    <script src="assets/js/core/popper.min.js" type="text/javascript"></script>
    <script src="assets/js/core/bootstrap-material-design.min.js" type="text/javascript"></script>
    <script src="assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
    <script src="assets/js/plugins/bootstrap-selectpicker.js"></script>
    <script src="assets/js/material-dashboard.min.js?v=2.0.2" type="text/javascript"></script>

    <!-- Initialize Bootstrap Select -->
    <script>
      $(document).ready(function() {
          $('.selectpicker').selectpicker();
      });
    </script>

    <?php
    if (isset($_GET['msg'])) {
        if ($_GET['msg'] == 1) {
            echo "<script type='text/javascript'>showNotification('top','right','Wrong Username/Password.', 'danger');</script>";
        } elseif ($_GET['msg'] == 2) {
            echo "<script type='text/javascript'>showNotification('top','right','Successfully Logout.', 'info');</script>";
        } elseif ($_GET['msg'] == 3) {
            echo "<script type='text/javascript'>showNotification('top','right','User Deactivated. Contact Administrator.', 'warning');</script>";
        }
    }
    ?>
  </div>
</body>
</html>
