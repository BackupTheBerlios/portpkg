<html>

<head>
    <title>The Portpkg Project</title>

    <meta name="author" content="Portpkg Project" />
    <meta name="copyright" content="T. Pfaff" />
    <meta name="keywords" content="ports, portsystem, buildscript, slackbuild, slackware, source, package, manager, portpkg" />
    <meta name="description" content="Source package system for Slackware Linux" />
    <meta name="robots" content="index,nofollow" />

    <style type="text/css">
<!--
body
    {
    background-color: #555;
    color: #222;
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
    text-indent: 1em;
    }
h1,h2,h3,h4
    {
    font-family: Verdana, Geneva, Arial, sans-serif;
    color: #333;
    font-weight: bold;
    line-height: 90%;
    letter-spacing: -2;
    }
em
    {
    letter-spacing: +1;
    }
a:link
    {
    color: #475;
    text-decoration: none;
    background-color: transparent;
    }
a:visited
    {
    color: #7aa;
    text-decoration: none;
    background-color: transparent;
    }
a:hover	{
    color: #f80;
    text-decoration: underline;
    background-color: transparent;
    }
a:active
    {
    color: #9bb;
    text-decoration: underline;
    background-color: transparent;
    }
#footer
    {
    position: relative;
    padding: 10px;
    font-family: "Trebuchet MS", sans-serif;
    padding: 10px 20px;
    margin-top: 10px;
    clear: left;
    }
#header
    {
    margin: 20 10 0 10;
    }
#page
    {
    font-size: 11px;
    font-family: Verdana, Geneva, Arial, sans-serif;
    line-height: 180%;
    background-color: #ddd;
    text-align: left;
    visibility: visible;
    margin-right: auto;
    margin-left: auto;
    position: relative;
    border: 1px solid #334;
    }
#navi
    {
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
    background-color: #eee;
//    position: relative;
    padding: 10px 20px;
    margin-top: 10px;
    width: 65%;
    float: left;
    border: 1px solid #999;
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
	    <table id="header">
		<tr>
		    <td>
<img src="logo.png"/>
		    </td>
		    <td>
<h1><big>The Portpkg Project</big></h1>
<h2>Source package system for Slackware<br>
since 2004</h2>
		    </td>
		</tr>
	    </table>
	    
	    <div id="navi">
<a href="http://developer.berlios.de/project/showfiles.php?group_id=2486">Download</a> /
<a href="http://developer.berlios.de/mail/?group_id=2486">Mailinglists</a> /
<a href="http://developer.berlios.de/forum/?group_id=2486">Forums</a> /
<a href="http://developer.berlios.de/projects/portpkg">Project Page</a> /
<a href="http://cvs.berlios.de/cgi-bin/viewcvs.cgi/portpkg/ports">Browse CVS</a> /
<a href="people">People</a>

<div align="left">
<a href="doc.php?doc=NEWS">News</a> /
<a href="doc.php?doc=INSTALL">Install</a> /
<a href="doc.php?doc=README">Readme</a> /
<a href="doc.php?doc=ABOUT">About</a> /
<a href="doc.php?doc=FAQ">FAQ</a> /
<a href="doc.php?doc=README.Links">Links</a> /
<a href="doc.php?doc=ROADMAP">Roadmap</a> /
<a href="doc.php?doc=ChangeLog">ChangeLog</a>
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
    $line = ereg_replace('^([-/0-9]{10})','<p><small><em>\1</em></small><br>',$line);
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

<h2>Change log</h2>
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
      $date = ereg_replace('^([-0-9]{10}) +([^ ]*) +<(.*)>.*$','<p><small><em>\1 by <a href="mailto:\3">\2</a></em></small><br>',$line);
    } elseif (ereg('[^ ]+[./]SlackBuild[,:]',$line)) {
//      preg_match_all('|([^ ]+)[./]SlackBuild[,:].*:(.*)|',$line,$matches,PREG_SET_ORDER);
//      if ($matches[0][2] == "") {
      preg_match_all('!([^ ]+)[./]SlackBuild[,:]!',$line,$matches,PREG_SET_ORDER);
      $log = ereg_replace('^.*[./]SlackBuild:','',$line);
      if ($log == "\n") {
          $line = fgets($file);
//          $log = ereg_replace('\*','',$line);
//      } else
//        $log = $matches[0][2];
          $log = ereg_replace('^ +\*','',$line);
      }
      if ($date != $last_date) {
  	print($date);
	$last_date = $date;
      }
      foreach ($matches as $match) {
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
