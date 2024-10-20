<?php
session_start();
$loc = $_SESSION['loc'];
include './functions/dbconn.php';
include './functions/general.php';

// Function for better error handling
function handleQuery($query, $conn, $errorMsg)
{
    $result = mysqli_query($conn, $query);
    if (!$result) {
        die("Invalid query: $errorMsg" . mysqli_error($conn));
    }
    return $result;
}

$sql = "DELETE FROM `tmp2` WHERE `time` < DATE_SUB(NOW(), INTERVAL '00:10' MINUTE_SECOND)";
handleQuery($sql, $conn, "Deleting from tmp2");

if (isset($_GET['id'])) {
    $usn = strtoupper($_GET['id']);
    $date = date('Y-m-d');
    $time = date('H:i:s');
    error_reporting(E_ALL);

    // Patron data fetching
    $sql = "SELECT CONCAT(title,' ',name) AS name, borrowernumber, gender, categorycode, programcode, sort1, sort2, mobile, email FROM borrowers WHERE cardnumber='$usn'";
    $data1 = mysqli_fetch_row(handleQuery($sql, $conn, "Fetching patron data"));

    if (!is_null($data1)) {
          // Skip dateexpiry check for 'CAT001'
    if ($data1[3] !== 'CAT001') {
        $sql = "SELECT CONCAT(title,' ',name) AS name, borrowernumber, gender, categorycode, programcode, sort1, sort2, mobile, email FROM borrowers WHERE cardnumber='$usn' AND dateexpiry > '$date'";
        $data1 = mysqli_fetch_row(handleQuery($sql, $conn, "Fetching patron data"));
    }
        // Image fetching
        $sql = "SELECT imagefile FROM patronimage WHERE borrowernumber = '$data1[1]'";
        $data2 = mysqli_fetch_row(handleQuery($sql, $conn, "Fetching patron image"));

        // Check if $data2 is not null before accessing array index
        if (!is_null($data2)) {
            $e_img = $data2[0];
        } else {
            $e_img = null;
        }

        // Patron category code fetching
        $sql = "SELECT description FROM categories WHERE categorycode = '$data1[3]'";
        $data3 = mysqli_fetch_row(handleQuery($sql, $conn, "Fetching patron category code"));

        // Check if $data3 is not null before accessing array index
        if (!is_null($data3)) {
            $data3_desc = $data3[0];
        } else {
            $data3_desc = null;
        }

        // Branch information fetching
        $branchName = null;
        if (!is_null($data1[4])) {
            $sql = "SELECT branchname FROM branches WHERE programcode= '$data1[4]'";
            $data4 = mysqli_fetch_row(handleQuery($sql, $conn, "Fetching branch information"));

            // Check if the result is not null before accessing array index
            if (!is_null($data4)) {
                $branchName = $data4[0];
            }
        }
    }

    if ($data1) {
        $sql = "SELECT * FROM `inout` WHERE `cardnumber` = '$usn' AND `date` = '$date' AND `status` = 'IN'";
        $exit = mysqli_fetch_row(handleQuery($sql, $conn, "Checking IN status"));

        if ($exit) {
            $chk = "SELECT `usn` FROM tmp2 WHERE `usn`='$usn'";
            $chk3 = mysqli_fetch_row(handleQuery($chk, $conn, "Checking tmp2"));

            if (!$chk3) {
                $sql = "SELECT * FROM `inout` WHERE `cardnumber` = '$usn' AND `date` = '$date' AND `status` = 'IN'";
                $chk4 = mysqli_fetch_array(handleQuery($sql, $conn, "Checking IN status again"));

                if ($chk4['loc'] != $_SESSION['locname']) {
                    $sql = "UPDATE `inout` SET `exit` = '$time', `status` = 'OUT' WHERE `sl` = $exit[0];";
                    handleQuery($sql, $conn, "Updating OUT status");

                    $sl = getsl($conn, "sl", "inout");
                    $sql = "INSERT INTO `inout` (`sl`, `cardnumber`, `name`, `gender`, `date`, `entry`, `exit`, `status`, `loc`, `cc`, `branch`, `sort1`, `sort2`, `email`, `mob`) VALUES ('$sl', '$usn', '$data1[0]', '$data1[2]', '$date', '$time', '" . $_SESSION['libtime'] . "', 'IN', '$loc', '$data3[0]', '$branchName', '$data1[5]', '$data1[6]', '$data1[8]', '$data1[7]');";
                    handleQuery($sql, $conn, "Inserting new IN record");

                    $e_name = $data1[0];
                    $d_status = "IN";
                    $msg = "1";
                    $e_img = !is_null($data2) ? $data2[0] : null;  // Check if $data2 is not null before accessing array index
                    $time1 = date('g:i A', strtotime($time));
                    $sql = "INSERT INTO `tmp2` (`usn`, `time`) VALUES ('$usn', CURRENT_TIMESTAMP);";
                    handleQuery($sql, $conn, "Inserting into tmp2");
                } else {
                    $sql = "UPDATE `inout` SET `exit` = '$time', `status` = 'OUT' WHERE `sl` = $exit[0];";
                    handleQuery($sql, $conn, "Updating OUT status again");

                    $sql = "SELECT SUBTIME(`exit`, `entry`)  FROM `inout` WHERE `cardnumber`='$usn' AND `sl` = $exit[0];";
                    $otime = mysqli_fetch_row(handleQuery($sql, $conn, "Fetching overtime"));

                    $e_name = $data1[0];
                    $d_status = "OUT";
                    $msg = "4";
                    $e_img = !is_null($data2) ? $data2[0] : null;  // Check if $data2 is not null before accessing array index
                    $time1 = date('g:i A', strtotime($time));
                    $sql = "INSERT INTO `tmp2` (`usn`, `time`) VALUES ('$usn', CURRENT_TIMESTAMP);";
                    handleQuery($sql, $conn, "Inserting into tmp2");
                }
            } else {
                $msg = "2";
                $e_name = NULL;
                $d_status = NULL;
                $e_img = NULL;
                $date = NULL;
                $time1 = "-";
            }   
        } else {
            $chk = "SELECT `usn` FROM tmp2 WHERE `usn`='$usn'";
            $chk3 = mysqli_fetch_row(handleQuery($chk, $conn, "Checking tmp2 again"));

            if ($chk3) {
                $msg = "5";
                $e_name = NULL;
                $d_status = NULL;
                $e_img = NULL;
                $date = NULL;
                $time1 = "-";
            } elseif ($data1) {
                $sl = getsl($conn, "sl", "inout");
                $sql = "INSERT INTO `inout` (`sl`, `cardnumber`, `name`, `gender`, `date`, `entry`, `exit`, `status`, `loc`, `cc`, `branch`, `sort1`, `sort2`, `email`, `mob`) VALUES ('$sl', '$usn', '$data1[0]', '$data1[2]', '$date', '$time', '" . $_SESSION['libtime'] . "', 'IN', '$loc', '$data3[0]', '$branchName', '$data1[5]', '$data1[6]', '$data1[8]', '$data1[7]');";
                handleQuery($sql, $conn, "Inserting new IN record");

                $e_name = $data1[0];
                $d_status = "IN";
                $msg = "1";
                $e_img = !is_null($data2) ? $data2[0] : null;  // Check if $data2 is not null before accessing array index
                $time1 = date('g:i A', strtotime($time));
                $sql = "INSERT INTO `tmp2` (`usn`, `time`) VALUES ('$usn', CURRENT_TIMESTAMP);";
                handleQuery($sql, $conn, "Inserting into tmp2");
            }
        }
    } else {
        $msg = "3";
        $e_name = NULL;
        $d_status = NULL;
        $e_img = NULL;
        $date = NULL;
        $time1 = "-";
    }
} else {
    $e_name = NULL;
    $d_status = NULL;
    $e_img = NULL;
    $msg = NULL;
    $date = NULL;
    $time1 = "-";
}
?>
