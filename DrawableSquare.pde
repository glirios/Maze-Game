/**
 * DrawableSquare.java
 *
 * This class is to help draw the square    
 *
 * @Giovanni Lirios
 * @April 30, 2015
 */

public class DrawableSquare extends Square implements Drawable
{
        PImage log = loadImage("data/log.png");
        PImage up_log = loadImage("data/up_log.png");
        public DrawableSquare(boolean up, boolean right, boolean down, boolean left, int row, int col)
        {
                super(up, right, down, left, row, col);
        }

        public void draw()
        {
          if(super.inView() == true) 
          {
            pushMatrix();
              translate(super.x(), super.y());
              noStroke();
              fill(0, 200, 0);
              rect(0, 0, 50, 50);
            popMatrix();
            if(super.wall(0) == true)
            {
              pushMatrix();
                translate(super.x(), super.y());
                scale(.035);
                image(log, 0, 0);
              popMatrix();
            }
            if(super.wall(2) == true)
            {  
              pushMatrix();
                translate(super.x(), super.y() + 50);
                scale(.035);
                image(log, 0, 0);
              popMatrix();
            }
            if(super.wall(3) == true)
            {
              pushMatrix();
                translate(super.x() - 25, super.y() );
                scale(.5);
                image(up_log, 0, 0);
              popMatrix();
            }
            
            if(super.wall(1) == true)
            {
              pushMatrix();
                translate(super.x() + 25, super.y() );
                scale(.5);
                image(up_log, 0, 0);
              popMatrix();
            }
          }
          else if(super.seen() == true && super.inView() == false)
          {
            pushMatrix();
              translate(super.x(), super.y());
              noStroke();
              fill(0, 150, 0);
              rect(0, 0, 50, 50);
            popMatrix();
            if(super.wall(0) == true)
            {
              pushMatrix();
                translate(super.x(), super.y());
                scale(.035);
                image(log, 0, 0);
              popMatrix();
            }
            if(super.wall(2) == true)
            {  
              pushMatrix();
                translate(super.x(), super.y() + 50);
                scale(.035);
                image(log, 0, 0);
              popMatrix();
            }
            if(super.wall(3) == true)
            {
              pushMatrix();
                translate(super.x() - 25, super.y() );
                scale(.5);
                image(up_log, 0, 0);
              popMatrix();
            }
            
            if(super.wall(1) == true)
            {
              pushMatrix();
                translate(super.x() + 25, super.y() );
                scale(.5);
                image(up_log, 0, 0);
              popMatrix();
            }            
          }
        }
}
