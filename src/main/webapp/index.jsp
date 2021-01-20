<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link rel="stylesheet" href="css/style.css"/>
               
        <title>Image to Text Converter</title>
    </head>
    
    <body>
        <div class="container">
            
            <%@include file="header.jsp" %>
            
            <div class="container-fluid" style="color:black;">
                    <hr><br>
                    <div class="row">
                        <div class="col-sm-2">
                            <h4>
                                <b style="color: #ff8000;">What does it do?</b>
                            </h4>
                        </div>
                        <div class="col-sm-10">
                            <h4>
                                This is an application that transforms images 
                                into plain text symbols 
                                (<b style="color: blue;"> . : + ? & @</b>  ). 
                                It iterates through the pixels and assign a text value 
                                to them based on their RGB values.
                            </h4>
                        </div>                        
                    </div>
                    <br><br>
                    <div class="row">
                        <div class="col-sm-2">
                            <h4>
                                <b style="color: #ff8000;">Requirements</b>
                            </h4>
                        </div>
                        <div class="col-sm-10">
                            <h4>
                                Image files ( .jpg, .png, .gif ) 
                                <b style="color: blue;">under 5mb size</b> and 
                                <b style="color: blue;">over 400px wide</b>.
                            </h4>
                            <h4>
                                Every image is resized to be 400px wide to 
                                accomodate the text into every possible screen 
                                resolution. Due to this conversion, if the image 
                                is <b style="color: crimson;">under 400px wide</b>, 
                                artifacts and / or weird behavior might occur.
                            </h4>
                        </div>                        
                    </div>                   
                    <br><br>
                    <div class="row">
                        <div class="col-sm-2">
                            <h4>
                                <b style="color: #ff8000;">To be added</b>
                            </h4>
                        </div>
                        <div class="col-sm-10">
                            <h4>
                                Option to save the image as text or image 
                                without the need to copy / screenshot it.
                            </h4>
                            <h4>
                                The algorythm is not perfect by any means and 
                                some color combinations are difficult 
                                to display properly.
                            </h4>
                        </div>                        
                    </div>                   
                    <br>
                    
                    <br><hr>
                    <h3 class="text-center" style="text-decoration: underline; color: #ff8000">
                        Disclaimer</h3>               
                
                    <h4>
                        The images you upload <b style="color: blue;">won't be stored 
                        in the server</b>. The image is processed through the user 
                        request and outputs the result directly. You can see the 
                        code in <a href="https://github.com/alesjdev/PicToText">
                        <b style="color: green;">GitHub</b></a>. Please leave any 
                        reccomendations, suggestions or bugs there too. Thank you!
                    </h4>
                    <br><hr><br>
            </div>
         
            <div class="container-fluid">                
                <form action="Converter" method="post" enctype="multipart/form-data">
                    <h5>Choose an image:</h5>
                    <input type="file" name="file" id="file" accept="image/*" class="btn btn-default" required />
                    <br>
                    <h5>Choose background / text color:</h5>                        
                    <input type="radio" id="darkBackground" name="darkBackground" value="true" required>
                    <label for="darkBackground"> White text over dark background <span style="color:green;">(Reccommended)</span></label><br>
                    <input type="radio" id="lightBackground" name="darkBackground" value="false">
                    <label for="lightBackground"> Dark text over white background <span style="color:#ff8000;">(Experimental)</span></label><br>

                    <br>
                    <button type="submit" class="btn btn-success">
                        <span class="glyphicon glyphicon-upload"></span> Upload File
                    </button>
                </form>               
                <br>
            </div>
        </div>            
    </body>
    
    <script>
        var uploadField = document.getElementById("file");

        uploadField.onchange = function() {
            if(this.files[0].size > 5242880){
               alert("Sorry, only files smaller than ~5mb are allowed.");
               this.value = "";
            };
        };
    </script>
    
</html>