
<!DOCTYPE HTML>  
<html>
<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <script src="bin/jsencrypt.min.js"></script>

	<style>
	body, html {
	  height: 100%;
	  margin: 0;
	}

	.bg {
	  /* The image used */
	  background-image: url("img_girl.jpg");

	  /* Full height */
	  height: 100%; 

	  /* Center and scale the image nicely */
	  background-position: center;
	  background-repeat: no-repeat;
	  background-size: cover;
	}
	</style>


<?php
include("key.php");
?>


	<script>
		
		function myfunction(){

		var encrypt = new JSEncrypt();

alert('<?php echo $pubKey;?>');

		var x = '<?php echo $pubKey;?>';


		encrypt.setPublicKey(x);

		var encrypted = encrypt.encrypt(<?php echo $_POST['candid'];?>);

		function post(path, params, method) {
		method = method || "post"; 
		var form = document.createElement("form");
		form.setAttribute("method", method);
		form.setAttribute("action", path);

		for(var key in params) {
		if(params.hasOwnProperty(key)) {
		var hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", key);
		hiddenField.setAttribute("value", params[key]);

		form.appendChild(hiddenField);
		}
		}

		document.body.appendChild(form);
		form.submit();
		}

		post("https://us-central1-bytecamp-c915c.cloudfunctions.net/helloWorld", {encr : encrypted, ids = <?php echo $max["tst"];?>});
		}



alert("hogya");

	</script>

</head>
<body>  
	<div class="container" align="center">
			<form method="POST">
    	
    			<h3>Election Information</h3>
    			
			          <input type="radio" name="candid" value="1">Modi
 					  <br>
			        
			          <input type="radio" name="candid" value="2">RaGa 
  					  <br>
			        
				    <input type ="submit" value="Submit" name="submit" class="waves-effect waves-light btn submitbtn" onclick="myfunction()" />
				    
			</form>
		</div>

      <!--Import jQuery before materialize.js-->
      
<?php
// define variables and set to empty values
$nameErr = $emailErr = $candidErr = $websiteErr = "";
$name = $email = $candid = $comment = $website = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
	if (empty($_POST["candid"])) {
    $candidErr = "candid is required";
  } else {
    $candid = test_input($_POST["candid"]);
  }
}
function test_input($data) {
  $data = trim($data);
  $data = stripslashes($data);
  $data = htmlspecialchars($data);
  return $data;
}
?>




</body>
</html>