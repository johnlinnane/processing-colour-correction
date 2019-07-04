PImage adjustBrightness(PImage p) {                              // function that changes brightness of a PImage argument
  PImage q = p.copy();                                           // temporary PImage class 
  q.loadPixels();                                                // load pixels from temporary PImage
  
  for ( int i = 0; i < q.pixels.length; i++)  {                  // loop through PImage
    if (alpha(q.pixels[i]) != 0) {                               // if the pixel is not invisible
      float red   = red(q.pixels[i]);                            // make variables out of the three colours
      float green = green(q.pixels[i]);
      float blue  = blue(q.pixels[i]);  
    
      red   += manualBrightnessScaling;                          // increase the brightness of each colour
      green += manualBrightnessScaling;
      blue  += manualBrightnessScaling;
      color c = color(red, green, blue);                         // creates a new colour with the new rgb values
      q.pixels[i] = c;                                           // remakes  PImage with new colours
    }
  }
  
  q.updatePixels();                                              // updates q PImage
  return q;                                                      // returns changed PImage
}
