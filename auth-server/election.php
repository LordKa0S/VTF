<!DOCTYPE HTML>  
<html>
<head>
<style>
.error {color: #FF0000;}
</style>
</head>
<?php
if(isset($_POST['submit'])){
      
        $voterid = $_POST['Voter_ID'];
        $aadhar = $_POST['Aadhar'];
        $otp = $_POST['OTP'];
        $sel_c = "SELECT hasVoted from info where voter_id='$voterid' AND aadhar='$aadhar' AND OTP='$otp'";
        
        $run_c = mysqli_query($conn, $sel_c);
        
        $check = mysqli_num_rows($run_c); 


        if($check==0){
          ?>
          <script type="text/javascript">alert("Not a valid voter");
        die();</script>
          <?php 
        }
        else {
          $row=mysqli_fetch_assoc($runQuery);
          if($row['hasVoted']==1){
            ?><script type="text/javascript">alert("You have already voted");</script>
            <?php
          }
          else{
            mysqli_query($conn,"UPDATE info SET hasVoted=1 WHERE voter_id='$voterid' ");
            header("location: index.php");
          }
        }}
        ?>
<body>  

<?php
include('connect.php');
// define variables and set to empty values
// $nameErr = $Voter_IDErr = $genderErr = $AadharErr = "";
// $name = $Voter_ID = $gender = $comment = $Aadhar = "";

// if ($_SERVER["REQUEST_METHOD"] == "POST") {
//   if (empty($_POST["name"])) {
//     $nameErr = "Name is required";
//   } else {
//     $name = test_input($_POST["name"]);
//     // check if name only contains letters and whitespace
//     if (!preg_match("/^[a-zA-Z ]*$/",$name)) {
//       $nameErr = "Only letters and white space allowed"; 
//     }
//   }
  
//   if (empty($_POST["Voter_ID"])) {
//     $Voter_IDErr = "Voter_ID is required";
//   } else {
//     $Voter_ID = test_input($_POST["Voter_ID"]);
//   }
    
//   if (empty($_POST["Aadhar"])) {
//     $Aadhar = "";
//   } else {
//     $Aadhar = test_input($_POST["Aadhar"]);
//   }
// }

// function test_input($data) {
//   $data = trim($data);
//   $data = stripslashes($data);
//   $data = htmlspecialchars($data);
//   return $data;
// }
?>

<div class="container" align="center">
<h2>Verification</h2>
<p><span class="error">* required field</span></p>
<form method="post" >  
  Name: <input type="text" name="name">
  <!-- <span class="error">* <?php echo $nameErr;?></span> -->
  <br><br>
  Voter ID: <input type="text" name="Voter_ID">
  <!-- <span class="error">* <?php echo $Voter_IDErr;?></span> -->
  <br><br>
  Aadhar: <input type="text" name="Aadhar">
  <!-- <span class="error"><?php echo $AadharErr;?></span> -->
  <br><br>
  OTP: <input type="text" name="OTP">
  <!-- <span class="error"><?php echo $AadharErr;?></span> -->
  <br><br>
  <input type="submit"  value="Generate OTP"> 
  <input type="submit" name="submit" value="Submit">  
</form>
</div>



</body>
</html>