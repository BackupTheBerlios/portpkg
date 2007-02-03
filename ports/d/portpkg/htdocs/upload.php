<?php
$upload_dir = "upload/";
$max_size = 250000;
$var="file";
if (!is_dir("$upload_dir"))
  die("Error: directory $upload_dir doesn't exist!\n");
if (!is_writeable("$upload_dir"))
  die("Error: directory $upload_dir is not writable!\n");
if ($_FILES["$var"]['tmp_name'] == "")
  $var="filetoupload";
if (is_uploaded_file($_FILES["$var"]['tmp_name'])) {
  $filesize = $_FILES["$var"]['size'];
  $filename = $_FILES["$var"]['name'];
  $filetmp = $_FILES["$var"]['tmp_name']
  if ($filesize < 1)
    die("Error: no file selected!\n");
  if ($filesize > $max_size)
    die("Error: file is too big (more than $max_size bytes)!\n");
  if (file_exists($upload_dir.$filename))
    die("Error: $filename does already exist!\n");
  if (!move_uploaded_file($filetmp,$upload_dir.$filename))
    die("Error: file couldn't be moved!\n");
  else {
    printf("Success: $filename has been submitted!\n");
    mail("toastbrot@web.de","Portpkg: Upload ($filename)","$filename");
  }
}
?> 
