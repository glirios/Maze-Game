/**
 * DrawableExplorer.java
 *
 * This class is to draw the explorer
 *
 * @Giovanni Lirios
 * @April 30, 2015
 */

public class DrawableExplorer extends Explorer implements Drawable
{
        public DrawableExplorer( Square location, Maze maze, String name )
        {
                super( location, maze, name );
        }
        
        public void draw()
        {
          pushMatrix();
            translate(super.location().x() + 25, super.location().y() + 10);
            scale(.4);
            pushMatrix();
              translate(0, 30);
              fill(#804D15);
              ellipse(0, 30, 80, 50);
              ellipse(0, 0, 100, 70);
              fill(#D4A26A);
              ellipse(0, 30, 60, 40);
              ellipse(0, 0, 80, 60);
            popMatrix();
            
            pushMatrix();
              translate(0, 60);
              fill(0);
              ellipse(0, 0, 40, 20);
            popMatrix();
            
            pushMatrix();
              translate(-20, 30);
              ellipse(0, 0, 10, 20);
              translate(40, 0);
              ellipse(0, 0, 10, 20);
            popMatrix();         

          popMatrix();
        }
}
