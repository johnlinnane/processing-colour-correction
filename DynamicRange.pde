void dynamicRange(PImage bg, PImage fg) {                                // create function to map the min and max of background brightness to foreground brightness
                                                                         
  bg.loadPixels();                                                       // load pixels from foreground and background
  fg.loadPixels(); 
  
  
  float[] bgBrightList = new float[bg.pixels.length];                    // get brightness values of background and foreground videos 
  float[] fgBrightList = new float[fg.pixels.length];
  
  for (int i = 0; i < bg.pixels.length; i += 1) {                        // get brightness values for background
    bgBrightList[i] = brightness(bg.pixels[i]);
  }
  
  for (int i = 0; i < fg.pixels.length; i += 1) {                        // get brightness values for foreground
    fgBrightList[i] = brightness(fg.pixels[i]);
  }
  
  float bgMin = min(bgBrightList);                                       // find lowest and highest brightness value of background and foreground videos
  float bgMax = max(bgBrightList);  
  float fgMin = min(fgBrightList); 
  float fgMax = max(fgBrightList);  
  
  
  float[] fgArray = new float[fg.pixels.length];                         // create a array of new foreground values

  
  for (int j = 0; j < fg.pixels.length; j += 1) {                        // map foreground dynamic range to background dynamic range
    fgArray[j] = map(bg.pixels[j], fgMin, fgMax, bgMin, bgMax);
    int k = int(j); 
    fg.pixels[k] = int(constrain(fgArray[k], 0.0, 255.0));               // constrain brightness values to between 0 and 255, convert float to int
  }
  
  fg.updatePixels();                                                     // update foreground pixels
 
}
