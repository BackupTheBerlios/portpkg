<html>

<head>
    <title>Portpkg&mdash;Source package system for Slackware</title>

    <meta name="author" content="Portpkg Project">
    <meta name="copyright" content="T. Pfaff">
    <meta name="keywords" content="ports, portsystem, buildscript, slackbuild, slackware, source, package, manager, portpkg">
    <meta name="description" content="Source package system for Slackware Linux">
    <meta name="ROBOTS" content="NOINDEX, NOFOLLOW">

    <style type="text/css">
<!--
body
    {
    background-color: #999;
    color: #aaa;
    margin-top: 20px;
    margin-left: 10%;
    margin-right: 10%;
    margin-bottom: 70px;
    font-family: Georgia, "Times New Roman", Times, serif;
    font-size: small;
    line-height: 180%;
    }
p
    {
    font-family: "Trebuchet MS", sans-serif;
    text-indent: 3em;
    }
h1,h2,h3,h4
    {
    font-family: Verdana, Geneva, Arial, sans-serif;
    color: #799;
    font-weight: bold;
    line-height: 90%;
    letter-spacing: -2;
    }
ul
    {
    list-style-image: url(imgs/smiley.gif);
    }
ul li
    {
    margin: 1em 0 1em 0;
    }
a:link
    {
    color: #a79;
    text-decoration: none;
    background-color: transparent;
    }
a:visited
    {
    color: #966;
    text-decoration: none;
    background-color: transparent;
    }
a:hover	{
    color: #47d;
    text-decoration: underline;
    background-color: transparent;
    }
a:active
    {
    color: #755;
    text-decoration: underline;
    background-color: transparent;
    }
#footer
    {
    background-color: #282828;
    position: relative;
    padding: 10px;
    font-family: "Trebuchet MS", sans-serif;
    padding: 10px 20px;
    margin-top: 10px;
    clear: left;
    }
#header
    {
    padding: 20px;
    position: relative;
    text-align: center;
    font-family: verdana, geneva, arial, sans-serif;
    font-size: 42px;
    font-weight: bold;
    height: 110px;
    line-height: 90%;
    letter-spacing: -3;
    }
#subheader
    {
    padding: 5px;
    position: relative;
    text-align: center;
    font-family: verdana, geneva, arial, sans-serif;
    font-size: 12px;
    font-weight: bold;
    line-height: 90%;
    letter-spacing: -1;
    }
#page
    {
    font-size: 11px;
    font-family: Verdana, Geneva, Arial, sans-serif;
    line-height: 180%;
    background-color: #221;
    text-align: left;
    visibility: visible;
    margin-right: auto;
    margin-left: auto;
    position: relative;
    width: 600px;
    border: 1px solid #bba;
    }
#navi
    {
    background-color: #282828;
    text-align: right;
    padding: 0px 20px;
    margin-top: 10px;
    font-weight: bold;
    }
#mainbox
    {
    background-color: transparent;
    text-align: left;
    padding: 0px 20px;
    margin-top: 10px;
    }
#box
    {
    background-color: #112;
    position: relative;
    padding: 10px 20px;
    margin-top: 10px;
    width: 65%;
    float: left;
    border: 1px solid #667;
    border-left: 0;
    border-bottom: 0;
    }
#sidebar
    {
    position: relative;
    padding: 10px;
    margin-top: 10px;
    width: 20%;
    margin-left: 10px;
    float: left;
    font-size: xx-small;
    line-height: 120%;
    }
-->
    </style>
</head>

<body>
    <div>
	<div id="page">
	    <div id="header">
		<div style="float: left">
<img src="logo.png"/>
	    </div>
	    <div>
Portpkg&mdash;Source package system for Slackware<br>
	    </div>
	    </div>
	    <div id="subheader">
since 2004
	    </div>

	    <div id="navi">
<a href="http://developer.berlios.de/project/showfiles.php?group_id=2486">Download</a> /
<a href="http://developer.berlios.de/forum/?group_id=2486">Forums</a> /
<a href="http://developer.berlios.de/projects/portpkg">Project Page</a> /
<a href="http://cvs.berlios.de/cgi-bin/viewcvs.cgi/portpkg/ports">Browse CVS</a> /
<a href="people">People</a>

<div align="left">
<a href="NEWS">doc.php?doc=News</a> /
<a href="INSTALL">doc.php?doc=Install</a> /
<a href="README">doc.php?doc=Readme</a> /
<a href="ABOUT">doc.php?doc=About</a> /
<a href="FAQ">doc.php?doc=FAQ</a> /
<a href="README.Links">doc.php?doc=Links</a> /
<a href="ROADMAP">doc.php?doc=Roadmap</a> /
<a href="ChangeLog">doc.php?doc=ChangeLog</a>
</div>
	    </div>

	    <div id="mainbox">
<?php
$file = fopen('ABOUT','r');
if ($file) {
  print('<p>');
  while (!feof($file)) {
    $line = fgets($file);
    if (ereg('---',$line))
      break;
    if (!ereg('^About',$line))
      print($line);
  }
  fclose($file);
  print ('</p>');
}
?>
	    </div>

	    <div id="box">
<?php
$file = fopen('NEWS','r');
if ($file) {
  $lines = 0;
  while (!feof($file)) {
    $line = fgets($file);
    $lines++;
    if ($lines == 70) {
      print('(...)');
      break;
    }
    $line = ereg_replace('NEWS','<h2>News</h2>',$line);
    $line = ereg_replace('^([-/0-9]{10})','<p><em>\1</em><br>',$line);
    $line = ereg_replace('((ht|f)tp://[^ ]*[a-z0-9])','<a href="\1">\1</a>',$line);
    print ($line);
  }
  fclose($file);
}
?>
	    </div>

	    <div id="sidebar">
<a href="http://developer.berlios.de" title="BerliOS Developer">
<img src="http://developer.berlios.de/bslogo.php?group_id=2486" width="124px"
 height="32px" border="0" alt="BerliOS Developer Logo"></a>

<h2>Recent changes</h2>
<?php
$file = fopen('ports.ChangeLog','r');
if ($file) {
  $lines = 0;
  $items = 0;
  $date = "";
  while (!feof($file)) {
    $line = fgets($file);
    $lines++;
    if ($lines >= 200) {
      print ('(...)');
      break;
    }
    if (ereg('^[-0-9]{10} ',$line)) {
      $last_date = $date;
      $date = ereg_replace('^([-0-9]{10}).*$','<p><em>\1</em><br>',$line);
    } elseif (ereg('[^ ]+[./]SlackBuild[,:]',$line)) {
      preg_match_all('|([^ ]+)[./]SlackBuild[,:].*:(.*)|',$line,$matches,PREG_SET_ORDER);
      if ($matches[0][2] == "") {
          $line = fgets($file);
          $log = ereg_replace('\*','',$line);
      } else
        $log = $matches[0][2];
      foreach ($matches as $match) {
        if ($date != $last_date) {
  	  print($date);
	  $last_date = $date;
        }
        print('<a href="http://cvs.berlios.de/cgi-bin/viewcvs.cgi/portpkg/ports/'.
          $match[1].'">'.$match[1].'</a> '.$log.'<br>');
        $items++;
        if ($items >= 30) {
          print ('(...)');
          break 2;
        }
      }
    }
  }
}
?>
	    </div>

    	    <div id="footer">
<b>Bug reports</b> and <b>manual ports contributions</b> go here:
		<form action="upload.php" method="post" enctype="multipart/form-data">
		    <input name="filetoupload" type="file">
		    <input name="MAX_FILE_SIZE" value="250000" type="hidden">
		    <input value="Upload" type="submit">
		</form>
	    </div>
	</div>
    </div>
</body>

</html>
