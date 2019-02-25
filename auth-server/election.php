<!DOCTYPE HTML>  
<html>
<head>
<style>
.error {color: #FF0000;}
</style>
</head>
<body>  

<?php
// define variables and set to empty values
$nameErr = $Voter_IDErr = $genderErr = $AadharErr = "";
$name = $Voter_ID = $gender = $comment = $Aadhar = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
  if (empty($_POST["name"])) {
    $nameErr = "Name is required";
  } else {
    $name = test_input($_POST["name"]);
    // check if name only contains letters and whitespace
    if (!preg_match("/^[a-zA-Z ]*$/",$name)) {
      $nameErr = "Only letters and white space allowed"; 
    }
  }
  
  if (empty($_POST["Voter_ID"])) {
    $Voter_IDErr = "Voter_ID is required";
  } else {
    $Voter_ID = test_input($_POST["Voter_ID"]);
  }
    
  if (empty($_POST["Aadhar"])) {
    $Aadhar = "";
  } else {
    $Aadhar = test_input($_POST["Aadhar"]);
  }
}

function test_input($data) {
  $data = trim($data);
  $data = stripslashes($data);
  $data = htmlspecialchars($data);
  return $data;
}
?>

<div class="container" align="center">
<h2>PHP Form Validation Example</h2>
<p><span class="error">* required field</span></p>
<form method="post" action="candid.php">  
  Name: <input type="text" name="name" value="<?php echo $name;?>">
  <span class="error">* <?php echo $nameErr;?></span>
  <br><br>
  Voter ID: <input type="text" name="Voter_ID" value="<?php echo $Voter_ID;?>">
  <span class="error">* <?php echo $Voter_IDErr;?></span>
  <br><br>
  Aadhar: <input type="text" name="Aadhar" value="<?php echo $Aadhar;?>">
  <span class="error"><?php echo $AadharErr;?></span>
  <br><br>
  <input type="submit" name="submit" value="Submit">  
</form>
</div>
</body>
</html>