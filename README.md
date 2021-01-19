# PicToText
This is a test web application to practice JSP and Servlets. It iterates through the pixels of an image selected by the user and assigns a text symbol based on their RGB values.

Every image is rescaled to 400px for the formula to work in every possible resolution. Due to this, images under 400px wide usually have blurry / blocky display.

What it does:
1. Image is received by the user in HTML form, validation that both file and radio buttons are checked, JS script validates size < 5mb.
2. Image is received as Part type object in the Servlet. Servlet validates size again and that the file isn't null. Conversion to Part > InputStream > BufferedImage. Validation that the resulting BufferedImage isn't null.
3. Picture is resized to 400px wide. Application iterates through horizontal pixels, reading the colors and adding the appropiate symbols to a StringBuilder using a static method from CharChooser class. It puts a space after every symbol except when it's at the end of the line where it puts a line break.
5. Symbols are chosen thicker or thinner based on the user's choice of dark/white background.
4. Text is sent to the display JSP, which displays the text with a dark/white background depending on user's choice.

#Important
The images used aren't stored anywhere. The image is processed through the user request and outputs the result directly.

#Things to add / improve:
Resizing based on device's width doesn't work properly in some resolutions. The normal behaviour of the text is to put a line break if it reaches the max width, but this messes up the display, so I tried to counter it with CSS, reducing the font size based on user device's width. This doesn't always work as intended.

White background mode doesn't display the text thick enough to be appreciated above the bright background.

