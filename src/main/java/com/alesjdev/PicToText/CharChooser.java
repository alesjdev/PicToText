/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alesjdev.PicToText;

import java.awt.Color;

/**
 *
 * @author Juan Ales
 */
public class CharChooser {
    
    /*
    Static method to return the proper character based on the color received and
    the background type. It returns a "thicker/thinner" character based on the
    number of two of it's values.
    */
    public static Character charByColor(Color pixelColor, boolean darkBackground ){
        
        //Values stored
        int red = pixelColor.getRed();
        int blue = pixelColor.getBlue();
        int green = pixelColor.getGreen();
        
        //The higher two of the values are, the thicker the character returned is.
        if((red>=212 && blue >=212) || (red>=212 && green >=212) || (blue>=212 && green >=212) ){
            return darkBackground ? '@' : '.';
        } else if((red>=170 && blue >=170) || (red>=170 && green >=170) || (blue>=170 && green >=170) ){
            return darkBackground ? '&' : ':';
        } else if((red>=127 && blue >=127) || (red>=127 && green >=127) || (blue>=127 && green >=127) ){
            return darkBackground ? '?' : '+';
        } else if((red>=85 && blue >=85) || (red>=85 && green >=85) || (blue>=85 && green >=85) ){
            return darkBackground ? '+' : '?';
        } else if((red>=42 && blue >=42) || (red>=42 && green >=42) || (blue>=42 && green >=42) ){
            return darkBackground ? ':' : '&';
        } else if((red>=0 && blue >=0) || (red>=0 && green >=0) || (blue>=0 && green >=0) ){
            return darkBackground ? '.' : '@';
        }
        
        return 'N';
        
    }
}
