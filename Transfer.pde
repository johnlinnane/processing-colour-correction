PImage applyScalingsFromTo(PImage r, PImage t) {                                            // apply colour scalings from reference to transfer
  PImage n = t.copy();                                                                      // make a copy of the secnd PImage arugument

  float [] s = new float[3];                                                                // create an array called s, with 3 elements
                                                                                            // anything we do for L, we do for A and B ?????
  
  float [] sdRef = getStandardDeviationsFrom(r);                                            // array of SDs from reference (first PImage argument)
  float [] sdTarget = getStandardDeviationsFrom(t);                                         // array of SDs from target (second PImage argument)
  float [] mTarget = getMeansFrom(t);                                                       // array of means of target (second PImage argument)
                                                                                            // how different the Std of the reference are from the target
  for (int j = 0; j < s.length; j += 1) {                                                   // go through s array                                     
    s[j] = 1 - manualVarianceScaling + manualVarianceScaling * sdRef[j] / sdTarget[j];      // replace values by a function of reference and target
    //         0.4                     0.4                              1.? ~ 0.?
  }

  n.loadPixels();                                                                            // load the pixels of the copy of the target image

  for (int i = 0; i < t.pixels.length; i += 1) {                                             // go through all target pixels
    if (alpha(n.pixels[i]) != 0) {                                                           // if they are not invisible...
      int [] cp = rgb2Lab(red(n.pixels[i]), green(n.pixels[i]), blue(n.pixels[i]));          // create an array with Luminane, Alpha, Beta values instead of RGB

      for (int j = 0; j < cp.length; j += 1) {                                               // go through the new LAB array
        cp[j] = int(s[j] * (cp[j] - mTarget[j]) + mTarget[j]);                               // new LAB array = (scaling factor - SDs) + means from target
      }

      int [] rgb = lab2RGB(cp[0], cp[1], cp[2]);                                             // create new array called rgb, which converts scaled LAB array back into rgb values
      n.pixels[i] = color(rgb[0], rgb[1], rgb[2]);                                           // create a new array of the copy of the target PImage...
    }                                                                                        // with the colour (?) values of the new array
  }
  n.updatePixels();                                                                          // update pixels from copy of target PImage
  return n;                                                                                  // return this PImage
}
