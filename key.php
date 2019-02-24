<?php
include("connect.php");

$config = array(
    "digest_alg" => "sha512",
    "private_key_bits" => 1024,
    "private_key_type" => OPENSSL_KEYTYPE_RSA,
);
    
// Create the private and public key
$res = openssl_pkey_new($config);

// Extract the private key from $res to $privKey
openssl_pkey_export($res, $privKey);

// Extract the public key from $res to $pubKey
$pubKey = openssl_pkey_get_details($res);
$pubKey = $pubKey["key"];

$pubKey = preg_replace("![^a-z0-9]+!i", "-", $pubKey);


mysqli_query($conn,"INSERT INTO pub VALUES ('','$privKey')");
$result = mysqli_query($conn, "SELECT max(id) AS tst FROM pub");
$max = mysqli_fetch_assoc($result);
// echo $max["tst"];
// $data = 'plaintext data goes here';
// echo "<br>";
// // Encrypt the data to $encrypted using the public key
// openssl_public_encrypt($data, $encrypted, $pubKey);
// // Decrypt the data using the private key and store the results in $decrypted
// openssl_private_decrypt($encrypted, $decrypted, $privKey);

?>