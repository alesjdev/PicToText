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
               
        <title>Img to text converter</title>
    </head>
    
    <%
        boolean darkBackground = request.getParameter("darkBackground").equals("true");
        if(!darkBackground){
            out.println("<body style='background-color: white; background-image:none; color:black;'>");
        } else {
            out.println("<body style=\"background-image: url('images/web_backgr.jpg')\">");
        }
    %>
        <div class="container">
            
            <%@include file="header.jsp" %>  
        </div>
        <br>
        <div class="container-fluid text-center">                       
            <a href="index.jsp" style="text-decoration: none;">
                <button class="btn btn-default">
                    <span class="glyphicon glyphicon-fast-backward"></span> Choose another image
                </button>
            </a>            
        </div>
        <br>       
        <div class="container-fluid text-center">
            <%
                StringBuilder textPic = (StringBuilder)request.getAttribute("textPicture");               
            %>
            <p><b><%= textPic %></b></p>
        </div>
        <br>
        <div class="container-fluid text-center">                       
            <a href="index.jsp" style="text-decoration: none;">
                <button class="btn btn-default">
                    <span class="glyphicon glyphicon-fast-backward"></span> Choose another image
                </button>
            </a>            
        </div>
        <br><br>
    </body>
    <%
    
    %>
</html>
