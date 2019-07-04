void userInterface() {
  noStroke();
  textAlign(LEFT, TOP);
  
  textSize(20);

  fill(0, 0, 0, 100); 
  rect(5, 5, 230, 50);
  fill(255);
  text("C: Colour Adjustment", 15, 17);
  
  fill(0, 0, 0, 100); 
  rect(240, 5, 200, 50);
  fill(255);
  text("D: Dynamic Range", 250, 17);  

  fill(0, 0, 0, 100); 
  rect(450, 5, 240, 50);  
  fill(255);
  text("Z: Change Background", 460, 17);  

  fill(0, 0, 0, 100); 
  rect(5, 65, 335, 50);
  fill(255);
  text("LEFT / RIGHT: Change Brightness", 15, 78);  

  fill(0, 0, 0, 100); 
  rect(350, 65, 340, 50);
  fill(255);
  text("UP / DOWN: Change Colour", 385, 78);  


  fill(0, 0, 0, 100); 
  rect(5, 125, 230, 50);
  fill(255);
  text("R: Red Grade", 15, 137);
  
  fill(0, 0, 0, 100); 
  rect(5, 185, 230, 50);
  fill(255);
  text("G: Green Grade", 15, 197);
  
  fill(0, 0, 0, 100); 
  rect(5, 245, 230, 50);
  fill(255);
  text("B: Blue Grade", 15, 257);


  fill(0, 0, 0, 100); 
  rect(5, 305, 230, 50);
  fill(255);
  text("N: No Grade", 15, 317);

}
