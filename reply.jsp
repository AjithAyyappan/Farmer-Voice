<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Reply </title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="style.css">
  </head>
  <body>
    <div id="controls">
  	 <button id="recordButton">Record</button>
  	 <button id="pauseButton" disabled>Pause</button>
  	 <button id="stopButton" disabled>Stop</button>
    </div>
    <div id="formats">Format: start recording to see sample rate</div>
  	<h3>Recordings</h3>
  	<ol id="recordingsList"></ol>
  	<% String aid=request.getParameter("aid");
  	String uss=request.getParameter("uss");
  	session.setAttribute("aid",aid);
  	session.setAttribute("uss",uss);
  	%>
  

    <!-- inserting these scripts at the end to be able to use all the elements in the DOM -->
  	<script src="https://cdn.rawgit.com/mattdiamond/Recorderjs/08e7abd9/dist/recorder.js"></script>
  	<script src="js/rep.js"></script>
    
  </body>
</html>