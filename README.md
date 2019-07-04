# processing-colour-correction
Colour Correction with Processing


Dynamic Compositing
John Linnane 
CS6114 
118227214 
MScIM 2018/2019

For this processing assignment I created a sketch for the Processing programming language which dynamically composited video content on to a variety of different backgrounds. Both natural and synthetic content can be selected for the composited foreground. Both foreground videos incorporate a chroma key (ie. black or blue) which can be removed using a colour similarity function. The dynamic range of the foreground was then matched to the background using a scaling function on brightness values. Luminance values were then utilised to perform a colour transfer using an algorithm to convert RGB (Red, Green, Blue) values to Lɑβ (Luminance, Alpha, Beta) values. A basic colour grade can then be applied using the tint() function.

Composite

For the overlaid content I used the chromakey() function to loop through the pixel array of the video and remove the key colour, in these cases green or blue. A variable for colour closeness is then created and colours are assessed as to how close to the key colour the individual pixels of the overlaid video are in the 3D colour space, using the dist() function. The ‘close colour distance’ value can vary due to how chroma key captured is rarely a single colour. Due to lighting and other environmental conditions, a green screen can be captured in hundreds of different colours. Reinhard describes the difficulties in compositing synthetic overlaid content with natural backgrounds, in particular matching the position of the light source. He also emphasises the importance of keeping computations as simple as possible, due to the high computational cost of presenting video content, especially at higher frame rates. He recommends combining chromatic adjustments processes within the steps for compositing, to limit pixel data transfer.[2]

Dynamic Range
 
In order to match the dynamic range of the foreground to that of the background. A function was created whereby two arrays are created containing the brightness value of every pixel for both the foreground and the background. The max and min of both of these arrays is then obtained using the max() and min() function. The map() function was then used to scale the max and min brightness values of the foreground to that of the background.

Colour Transfer

For the colour transfer a function was created to convert RGB values into Lɑβ values using the following formula:
Colour transfer function.

An opposing function was also created to switch back from Lɑβ to RGB.

The standard deviations of the Lɑβ values of each background pixel was obtained. A transform was then used to apply these values to the Lɑβ values of the foreground image. These Lɑβ transforms are better suited to matching high and low values, and are not as effective at matching mid-tones. Mean matching across different zones can be applied. While colour transfer can often produce believable composites, some instance might require more complicated readjustments, such as relighting.[4] There also other aspects beyond colour matching that need to be considered, such as achieving an appropriate grain, or the clipping of saturated colour data which cannot be retrieved.[1]

Multiple algorithms exist for colour transfer. Two examples of this are those of Reinhard, and Wang. The difference between these can be seen in the picture below:

[image]

A comparison of Reinhard and Wang’s colour transfer algorithms. [5]

Match white point and black point

The black point of an image is the point that has a value of 2% of a reflective black surface, and the white point has a value of 90% of a reflective black surface.[5] Headroom is allowed at either end to allow for anomalies such as specular highlights. These points are used to match the dynamic range of two composited images, such as in the following illustration:

Matching white and black points [5]
 

These principles were used in the processing sketch, whereby the minimum and maximum brightness values of the background image are being used as a scale on which to map the minimum and maximum values of the foreground image. This technique can also been seen in image editing software such as photoshop:

Adjusting white and black points in photoshop. [https://digital-photography-school.com/how-to-use-lab-color-in-photoshop-to-add-punch-to-your-images]

Colour Grading

For the colour grade I used the tint() function to apply a tint to the foreground image. Different instances of the function were implemented for red, green and blue. This can be activated from the User Interface through the R, G and B buttons on the computer keyboard.

User Interface

For the user interface, the viewer can toggle the dynamic range and colour transfer functions on and off. The brightness value of the dynamic range can be adjusted using the left and right arrow keys, as can the amount of colour transfer, using the up and down arrow keys. The ‘Z’ key is used to cycle through an array of different background images, this illustrates how the foreground content is altered to conform to differing background content. Finally, there are options for applying a tinted grade to the foreground image, using red, green and blue filters.
 
References

[1] François Pitié, Anil C. Kokaram, Rozenn Dahyot, Automated colour grading using colour distribution transfer, Computer Vision and Image Understanding, Volume 107, Issues 1–2, July– August 2007, Pages 123-137, ISSN 1077-3142, http://dx.doi.org/10.1016/j.cviu.2006.11.011.

[2] Erik Reinhard, Ahmet Oguz Akyuz, Mark Colbert, Charles E Hughes , Real-time color blending of rendered and captured video, Interservice/Industry Training, Simulation, and Education Conference (I/ITSEC) 2004

[3] Chung-Ming Wang, Yao-Hsien Huang, Ming-Long Huang, An effective algorithm for image sequence color transfer, Mathematical and Computer Modelling, Volume 44, Issues 7–8, October 2006, Pages 608-627, ISSN 0895-7177, http://dx.doi.org/10.1016/j.mcm.2006.01.029.

[4] S. Xue, A. Agarwala, J. Dorsey, and H. Rushmeier, Understanding and Improving the Realism of Image Composites, ACM Transactions on Graphics, vol. 31, issue 4, no. 84, New York, NY, USA, ACM (2012)

[5]Anon. 2018. Digital compositing for film and video: production workflows and techniques, New York: Routledge, Taylor & Francis Group.
