void keyPressed() {                                                                  // key pressed function
  switch (key) {                                                                     // switch statement depending on which key is pressed
  case 'c' :
    performColorAdjustment = !performColorAdjustment;                                // turn colour adjustment on
    break;
    
  case 'd' :
    adjustDynamicRange = !adjustDynamicRange;                                        // turn dynamic range on
    break;
  
  case 'z' :
    currentBackground = (currentBackground + 1) % backgroundFilenames.length;        // move to next background in array
    backgroundImage = loadImage(backgroundFilenames[currentBackground]);             // load this new background image
    foregroundMovie.read();                                                          // reads current frame of new foreground instance
    dynamicRange(backgroundImage, chromakey(foregroundMovie, keyColours));           // create dynamic range function betwen background and the foreground
    println(manualBrightnessScaling);                                                // print the scaling
    break;
    
  case 'r':
    tint(250, 200, 200);
    break;
  
  case 'g':
    tint(200, 250, 200);
    break;  
    
  case 'b':
    tint(200, 200, 250);
    break;
    
  case 'n':
    tint(255, 255, 255);
    break;

  case CODED:
    coded();                                                                  // call arrow key functions
    break;
  }
}

void coded() {
  switch (keyCode) {
  case UP:
    manualVarianceScaling = min(manualVarianceScaling + SCALING_UNIT, 1.0);          
    break;
  case DOWN:
    manualVarianceScaling = max(0, manualVarianceScaling - SCALING_UNIT);             
    break;
  case LEFT:
    manualBrightnessScaling = max(-255, manualBrightnessScaling - 5 * SCALING_UNIT); 
    break;
  case RIGHT:
    manualBrightnessScaling = min(manualBrightnessScaling + 5 * SCALING_UNIT, 255);  
    break;
  }
}
