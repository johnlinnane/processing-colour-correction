import processing.video.*;                                                        // import video library

float manualVarianceScaling = 0.5;                                                // amount to change colour
float manualBrightnessScaling = 0;                                                // initialise brightness value
final float SCALING_UNIT = 0.5;                                                   // amount to adjust brightness value by

// NATURAL FOREGROUND: uncomment this section to enable natural foreground 
//String foregroundFilename = "Subject.mov";                                      // file name of natural foreground
//color [] keyColours = { #00FF00 };                                              // use green chroma key
// end of natural foreground


// SYNTHETIC FOREGROUND: comment this out to enable natural foreground
String foregroundFilename = "TRex-720p-walk-02.mov";                              // file name of synthetic foreground
color [] keyColours = { #0000FF };                                                // use blue chroma key
// end of synthetic foreground


String [] backgroundFilenames = {"background-01.jpg",                             // array of background file names
"background-02.jpg", "background-03.jpg", "sunny-coast.jpg", 
"yellow.jpg", "gradient.001.jpg", "423.jpg"};
int currentBackground = 0;                                                        // use first background array index

float closeColourDistance = 125;                                                  // amount of colour similarity 
     
Movie foregroundMovie;                                                            // create Movie instance for foreground
PImage backgroundImage;                                                           // create image class instance for background
PImage compositeImage;                                                            // create image class instance for foreground 

boolean performColorAdjustment = false;                                           // start colour adjustment turned off
boolean adjustDynamicRange = false;                                               // start dynamic range turned off

void setup() {                                                                    // set the scene
  size(1280, 720);                                                                // frame size
  loadMovies();                                                                   // run function to load all the movies
  foregroundMovie.read();                                                         // reads current frame of foreground
  
  // get the average brightness difference between fore and background
  dynamicRange(backgroundImage, chromakey(foregroundMovie, keyColours));          // call dynamic range function
}

void loadMovies() {                                                               // load all movies
  backgroundImage = loadImage(backgroundFilenames[currentBackground]);            // makes PImage from whatever movie is in array
  
  foregroundMovie = new Movie(this, foregroundFilename);                          // make an instance of movie class from foreground video file
  
  foregroundMovie.loop();                                                         // loop foreground
}


void draw() {
  background(backgroundImage);                                                    // draw background from PImage from array file
  image(getImageHistogram(backgroundImage), width - 200, height - 200);           // draw histogram for background                            

  drawForegroundContent();                                                        // calls draw foreground function                                                                          
}


void drawForegroundContent() {                                                    // draw foreground
  if (foregroundMovie.available()) {                                              // checks if foreground is available
    foregroundMovie.read();                                                       // reads current frame of foreground
    compositeImage = chromakey(foregroundMovie, keyColours);                      // defines composite image as a chromakey function
  }
  if (adjustDynamicRange) {                                                       // if dynamic range is turned on
    displayAdjustAmount();                                                        // display amount that is being adjusted
    compositeImage = adjustBrightness(compositeImage);                            // apply adjustBrightness function to composite 
  }
  if (performColorAdjustment) {                                                   // if colour adjustment is done
    displayTransferAmount();                                                      // show the transfer amount
    compositeImage = applyScalingsFromTo(backgroundImage, compositeImage);        // apply trasfer scalings to values
    // name of the function need to be changed
  }
  
  userInterface();                                                                // display the UI
  image(compositeImage, 0, 0);                                                    // draws the composite image
  image(getImageHistogram(compositeImage), 0, height - 200);                      // show histogram of composite
}


void displayTransferAmount() {                                                    // show the amount of colour transfer
  textAlign(LEFT, BOTTOM);
  textSize(12);
  fill(0);
  rect(width - 105, 5, 100, 20);
  fill(255);
  text("t= " + manualVarianceScaling, width -100, 20);
}

void displayAdjustAmount() {                                                      // show the change in brightness
  textAlign(LEFT, BOTTOM);
  textSize(12);
  fill(0);
  rect(width - 105, 30, 100, 20);
  fill(255);
  text("b= " + manualBrightnessScaling, width -100, 45);
}
