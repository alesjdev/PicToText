<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link rel="stylesheet" href="css/style.css"/>
               
        <title>FIle Error</title>
    </head>
    
    <body>
        <div class="container">
            
            <%@include file="header.jsp" %>
            
            <div class="container-fluid text-center">               
                <br><h2 style="color:black;">
                Error: No picture loaded or file is not a proper image format 
                (.jpg, .png, .gif ...)</h2>
                <br><br>
                <a href="index.jsp" style="text-decoration: none;">
                    <button class="btn btn-default">
                        <span class="glyphicon glyphicon-fast-backward"></span> Try again
                    </button>
                </a> 
            </div>
        </div>            
    </body>   
</html>
