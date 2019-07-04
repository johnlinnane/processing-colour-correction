PImage chromakey(PImage m, color [] keyColours) {               // create chroma key class object with the green keyColours array
  PImage frame = createImage(m.width, m.height, ARGB);          // creates a new image
  
  frame.set(0, 0, m);                                           // changes the colour of a pixel in the new image
  frame.loadPixels();                                           // loads pixels into the new image

  for (int i = 0; i < frame.pixels.length; i += 1) {            // go through all pixels in new image
    for (int j = 0; j < keyColours.length; j += 1) {            // go through all pixels in the green array
      if (similar(frame.pixels[i], keyColours[j])) {            // if they're similar....
        frame.pixels[i] = color(0, 0, 0, 0);                    // make them invisible!
      }
    }
  }
  frame.updatePixels();                                         // updates new frame PImage

  return frame;                                                 // return this new PImage
}

boolean similar(color c1, color c2) {                                                                  // function to see if distance is true or false
  return dist(red(c1), green(c1), blue(c1), red(c2), green(c2), blue(c2)) <= closeColourDistance;      // dist calculates the distance between two points (in 3D?)
}                                                                                                      
