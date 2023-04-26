<?php
$uploaddir = '/home/kalis/Desktop/test/php';
$uploadfile = $uploaddir . $_FILES['file']['name'];
move_uploaded_file($_FILES['file']['tmp_name'], $uploadfile)
?>
