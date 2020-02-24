/* 
 * RobotFaces.pde
 * 
 * Pete Prodoehl <pete@2xlnetworks.com>
 * 
 * <http://rasterweb.net/raster/>
 * 
 */

import processing.pdf.*;
import java.util.Date;


// set width and height of canvas as well as border at edges
int canvasWidth = 1280;
int canvasHeight = 720;

// most of the numbers below can be adjusted, play around with their values

float xpos = 50;  // x starting point in upper left
float ypos = 50;  // y starting point in upper left
float wall = 150; // attempt to preserve whitespace on right side

// step for each face, 
float step = 70;


float mimn = xpos;
float rowct = 0;
float multiple = 0;

/* ----------------------------------------------------------- */

// get date to use for filename
Date date = new Date();
long currentTime = date.getTime()/1000; 


void settings() {
  size(canvasWidth, canvasHeight);
}

void setup() {
  background(255);
  stroke(0);
  strokeWeight(1);
  beginRecord(PDF, "output-" + currentTime + ".pdf");
}

void draw() {

  noFill();
  rectMode(CENTER);
  ellipseMode(CENTER);
  
  float randx = random(30,64);
  float randy = random(30,54);
  float randoff = random(0,4);
  float radius = random(1,50);

  // head
  fill(255);
  rect(xpos, ypos, randx, randy, radius);
  
  // eyes
  rect(xpos-8, ypos-5, randx/10, randy/10);
  rect(xpos+8, ypos-5, randx/10, randy/10);

  // mouth
  rect(xpos, (ypos+5)+randoff, randx/2, randy/10);

      
  // end of a row
  if (xpos > (canvasWidth-wall)) {
    xpos = mimn;
    ypos = ypos + step;
    rowct++;
  }
  else {
    xpos = xpos + step;
  }
  
  // last row, then we save the PDF and exit
  if (ypos > (canvasHeight-wall)) {
    ypos = step;
    endRecord();
    exit();
  }

}
