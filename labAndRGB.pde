int [] rgb2Lab(float r, float g, float b) {                                   // create RGB to LAB (Luminance, alpha, beta) function
  int [] lab = new int[3];                                                    // create a new lab array with 3 elements

  lab[0] = int(0.3475 * r + 0.8231 * g + 0.5559 * b);                         // make first element of array - L
  lab[1] = int(0.2162 * r + 0.4316 * g - 0.6411 * b);                         // make second element of array - A
  lab[2] = int(0.1304 * r - 0.1033 * g - 0.0269 * b);                         // make third element of array - B

  return lab;                                                                 // return the array from this function
}

int [] lab2RGB(float l, float a, float b) {                                   // create LAB to RGB function
  int [] rgb = new int[3];                                                    // create a new rgb array with 3 elements

  rgb[0] = int(0.5773 * l + 0.2621 * a + 5.6947 * b);                         // make first element of array - R
  rgb[1] = int(0.5774 * l + 0.6072 * a - 2.5444 * b);                         // make second element of array - G
  rgb[2] = int(0.5832 * l - 1.0627 * a + 0.2073 * b);                         // make third element of array - B

  return rgb;                                                                 // return the array from this function
}
