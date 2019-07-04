static final color RED = #FF0000;                                              // set red colour                          
static final color GREEN = #00FF00;                                            // set green colour  
static final color BLUE = #0000FF;                                             // set blue colour  
static final color WHITE = #FFFFFF;                                            // set white colour  


PImage getImageHistogram(PImage p) {                                           // create histogram function
  int[] histogramR = new int[256];                                             // create an R array
  int[] histogramG = new int[256];                                             // create an G array
  int[] histogramB = new int[256];                                             // create an B array
  
  p.loadPixels();                                                              // load pixels from PImage
  for (int i = 0; i < p.pixels.length; i += 1) {                               // loop through array
    if (alpha(p.pixels[i]) > 0) {                                              // if pixel is not invisible
      histogramR[int(red(p.pixels[i]))] += 1;                                  // add 1 to red value of pixel
      histogramG[int(green(p.pixels[i]))] += 1;                                // add 1 to green value of pixel
      histogramB[int(blue(p.pixels[i]))] += 1;                                 // add 1 to blue value of pixel
    }
  }

  int histMax = maxOf(histogramR, histogramG, histogramB);                     // create a single value of the highest colour

  stroke(255);                                                                 // draw histogram
  PGraphics canvas = createGraphics(histogramR.length, 200);                    
  canvas.beginDraw();                                                           
  canvas.stroke(255);                                                           
  for (int i = 0; i < histogramR.length; i += 1) {                              
    drawBinInContextFor(canvas, histogramR[i], histMax, i, RED);               // draw red bars 
    drawBinInContextFor(canvas, histogramG[i], histMax, i, GREEN);             // draw green bars
    drawBinInContextFor(canvas, histogramB[i], histMax, i, BLUE);              // draw blue bars
  }
  canvas.endDraw();                                                            

  return canvas;                                                                
}

void drawBinInContextFor(PGraphics canvas, int v, int r, int pos, color c) {   // draw individual bars
  float h = map(v, 0, r, 0, canvas.height);                                    
  canvas.stroke(c);                                                             
  canvas.line(pos, canvas.height - h, pos, canvas.height);                      
}

int maxOf(int [] a, int [] b, int [] c) {                                      // make an array of the highest colours
  int maxA = max(a);                                                            
  int maxB = max(b);                                                            
  int maxC = max(c);                                                            

  return max(maxA, maxB, maxC);                                                // returns that value 
}


PImage getImageBrightnessHistogram(PImage p) {                                 // makes a brightness histogram
  int[] histogram = new int[256];                                               

  p.loadPixels();                                                               
  for (int i = 0; i < p.pixels.length; i += 1) {                                
    histogram[int(brightness(p.pixels[i]))] += 1;                               
  }
  int histMax = max(histogram);                                                 

  stroke(255);                                                                  
    PGraphics canvas = createGraphics(histogram.length, 200);                   
  canvas.beginDraw();                                                           
  canvas.stroke(255);                                                           
  for (int i = 0; i < histogram.length; i += 1) {                               
    drawBinInContextFor(canvas, histogram[i], histMax, i, WHITE);               
  }
  canvas.endDraw();                                                            
  
  return canvas;                                                               
}
