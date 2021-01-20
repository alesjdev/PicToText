package com.alesjdev.PicToText.servlets;

import com.alesjdev.PicToText.CharChooser;
import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Juan Ales
 */
@WebServlet(name = "Converter", urlPatterns = {"/Converter"})
@MultipartConfig
public class Converter extends HttpServlet {
    
    StringBuilder imgText;
    
    //Method to resize images to 400px wide.
    public BufferedImage resizeImage(BufferedImage img) { 
        
        int oldHeight= img.getHeight();
        int oldWidth = img.getWidth();
        
        int newWidth = 400;
        int newHeight = oldHeight * newWidth / oldWidth;     
        
        Image tmp = img.getScaledInstance(newWidth, newHeight, Image.SCALE_SMOOTH);
        BufferedImage dimg = new BufferedImage(newWidth, newHeight, BufferedImage.TYPE_INT_ARGB);
        Graphics2D g2d = dimg.createGraphics();
        g2d.drawImage(tmp, 0, 0, null);
        g2d.dispose();

        return dimg;
    }  
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        //We get the boolean where user indicates if wants dark background
        if (request.getParameter("darkBackground") == null){
            request.getRequestDispatcher("errorPage.jsp").forward(request, response);
        }
        boolean darkBackground = request.getParameter("darkBackground").equals("true");
        
        /* Grab the image from the request forwarded by the index (and validate
        size again, just in case) */
        Part part = request.getPart("file");
        if (part == null || part.getSize() > 5242880 ){
            request.getRequestDispatcher("errorPage.jsp").forward(request, response);
        }
        
        //Transform the Part into a BufferedImage
        InputStream is = part.getInputStream();
        BufferedImage picture = ImageIO.read(is);
        
        //If conversion was successful
        if(picture!=null){
            
            imgText = new StringBuilder();
            
            //Resize de image to be 400px wide, to go along with the CSS text resizing parameters
            picture = resizeImage(picture);
                        
            /* Iterates through the pixels horizontally,
            and then moves to the next line */
            for(int h = 0; h<picture.getHeight(); h++){
                for(int w=0; w<picture.getWidth(); w++){
                    
                    //It gets the color at the current position                   
                    Color actualColor = new Color(picture.getRGB(w, h));
                    
                    /* Call to the static method in CharChooser class, retrieves 
                    an appropiate char */
                    imgText.append(CharChooser.charByColor(actualColor, darkBackground));
                    
                    //We add a space after every character
                    if(w != picture.getWidth()-1){                                                                   
                        imgText.append(" ");
                        
                    /* Except when iterator's at the last pixel of the picture's 
                        width, it adds HTML backspace instead */    
                    } else if(w == picture.getWidth()-1){                                              
                        imgText.append("<br>");                       
                    }                
                }               
            }
            
            //Saving the Image as an attribute in the request.
            request.setAttribute("textPicture", imgText);
            
            //We send the result to the JSP that displays it.
            request.getRequestDispatcher("display.jsp").forward(request, response);
                       
        } else { //If there is no picture loaded, it goes to error page.
            request.getRequestDispatcher("errorPage.jsp").forward(request, response);
        }
        
        //End of code for handling the image
               
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
