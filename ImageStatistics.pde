float [] getMeansFrom(PImage p) {                                                                // get average LAB values from foreground image
  float [] m = new float [3];                                                                    // create an array of size 3
  int count = 0;                                                                                 // initialize the counter

  p.loadPixels();                                                                                // load pixels from foreground
  
  for (int i = 0; i < p.pixels.length; i += 1) {                                                 // loop through foreground
    if (alpha(p.pixels[i]) != 0) {                                                               // if the pixel is not invisible
      int [] cp = rgb2Lab(red(p.pixels[i]), green(p.pixels[i]), blue(p.pixels[i]));              // create new array that converts each foreground RGB value to LAB

      for (int j = 0; j < m.length; j += 1) {                                                    // loop through m array
        m[j] += cp[j];                                                                           // add mean array value to convert pixel value
      }
      count += 1;                                                                                // increase count
    }
  }

  for (int j = 0; j < m.length; j += 1) {                                                        // loop through m array
    m[j] /= count;                                                                               // divide value by length of array
  }

  return m;                                                                                      // get average LAB value of new array
}

float [] getStandardDeviationsFrom(PImage p) {                                                   // create function to get stadard deviation from a PImage
  float [] m = getMeansFrom(p);                                                                  // create new array with means
  float [] sd = new float [3];                                                                   // create new array for standard deviation
  int count = 0;

  p.loadPixels();

  for (int i = 0; i < p.pixels.length; i += 1) {
    if (alpha(p.pixels[i]) != 0) {                                                               // if pixel is not invisible
      int [] cp = rgb2Lab(red(p.pixels[i]), green(p.pixels[i]), blue(p.pixels[i]));         

      for (int j = 0; j < sd.length; j += 1) {
        sd[j] += ((cp[j] - m[j]) * (cp[j] - m[j]));                                              // fill standard deviation array with (LAB value - average value) * (LAB value - average value)
      }
      count += 1;                                                                                // increase count
    }
  }

  for (int j = 0; j < sd.length; j += 1) {                                                       // loop through standard deviation array
    sd[j] = sqrt(sd[j] / count);                                                                 // update standard deviation array with the squre root of (standard deviation value / amount in array)
  }

  return sd;
}
