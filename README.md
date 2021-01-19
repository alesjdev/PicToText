# PicToText
This is a test web application to practice JSP and Servlets. It iterates through the pixels of an image selected by the user and assigns a text symbol based on their RGB values.

The main problem I faced is with resizing based on device's width. The normal behaviour of the text is to put a line break if it reaches the max width (but this messes up the display, so I tried to counter it with CSS, reducing the font size based on user device's width.

Every image is rescaled to 400px for the formula to work in every possible resolution. Due to this, images under 400px wide usually have blurry / blocky display.

What it does:
1. Image is received in html form, validation that both file and radio buttons are checked, JS script validates size < 5mb.
2. Image is received as Part type object in the Servlet. Servlet validates size again and that file isn't null. Conversion to Part > InputStream > BufferedImage. Validation that the resulting BufferedImage isn't null.
3. Picture is resized to 400px wide. Application iterates through horizontal pixels, reading the colors and adding the appropiate symbols to a StringBuilder using a static method from CharChooser class. It puts a space after every symbol except when it's at the end of the line that it puts a line break.
5. Symbols are chosen thicker or thinner based on the user's choice of dark/white background.
4. Text is sent to the display JSP, which displays the text with a dark/white background depending on user's choice.
