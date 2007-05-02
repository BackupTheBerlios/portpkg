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
  $filetmp = $_FILES["$var"]['tmp_name'];
  if ($filesize < 1)
    die("Error: no file selected!\n");
  if ($filesize > $max_size)
    die("Error: file is too big (more than $max_size bytes)!\n");
  if (file_exists($upload_dir.$filename))
    die("Error: $filename does already exist!\n");
  if (!move_uploaded_file($filetmp,$upload_dir.$filename))
    die("Error: file couldn't be moved!\n");
  printf("Success: $filename has been submitted!\n");
//  if (ereg("\.buildlog$",$filename) || ereg("\.buildlog\.gz$",$filename) 
  if (ereg("\.buildlog(|\.gz)$",$filename)
   || ereg("\.patch(|\.gz)$",$filename)) {
    $mailto = "portpkg-devel@lists.berlios.de";
    if (ereg("\.patch(|\.gz)$",$filename)) {
      $subject = "Patch: $filename";
      $body = "This patch file has been uploaded on http://portpkg.berlios.de:\n\n";
    } else {
      $subject = "Buildlog: $filename";
      $body = "This is an automatic bug report, uploaded on http://portpkg.berlios.de:\n\n";
    }
    if (ereg("\.gz$",$filename)) {
      $f = gzopen($upload_dir.$filename,"r");
      while (!gzeof($f))
        $body = $body.gzgets($f);
      gzclose($f);
    } else
      $body = $body.file_get_contents($upload_dir.$filename);
    mail($mailto,$subject,$body);
//    if (mail($mailto,$subject,$body))
//      delete($upload_dir.$filename);
    printf("Your buildlog has been sent to $mailto.\n");
  } elseif (ereg("\.tar\.bz2$",$filename))
    mail("topf@users.berlios.de","Portpkg: Upload ($filename)","$filename");
}
?> 
