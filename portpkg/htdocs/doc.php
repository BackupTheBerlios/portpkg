<html>

<head>
    <title>Portpkg&mdash;Source package system for Slackware</title>

    <meta name="author" content="Portpkg Project">
    <meta name="copyright" content="T. Pfaff">
    <meta name="keywords" content="ports, portsystem, buildscript, slackbuild, slackware, source, package, manager, portpkg">
    <meta name="description" content="Source package system for Slackware Linux">
    <meta name="ROBOTS" content="NOINDEX, NOFOLLOW">
</head>

<body>
  <pre>
<?php
$file = fopen($_GET['doc'],'r');
if ($file) {
  while (!feof($file)) {
    $line = fgets($file);
    $line = ereg_replace('^([A-Z0-9_!])$','<h2>\1</h2>',$line);
    $line = ereg_replace('((ht|f)tp://[^ ]*[a-z0-9])','<a href="\1">\1</a>',$line);
    print ($line);
  }
  fclose($file);
}
?>
  </pre>
</body>

</html>
