/**
 * DrawableMonster.java
 *
 * This class is to help draw the monster
 *
 * @Giovanni Lirios
 * @April 30, 2015
 */

public class DrawableMonster extends Monster implements Drawable
{
        public DrawableMonster( Maze maze )
        {
                super( maze );
        }

        public DrawableMonster( Maze maze, long seed )
        {
                super( maze, seed );
        }

        public DrawableMonster( Maze maze, Square location )
        {
                super( maze, location );
        }

       public void draw()
       {  
         if(super.location().inView() == true)
         {
           pushMatrix();
            translate(super.location().x() + 25,super.location().y() + 25);
            scale(.35);
            noStroke();
            fill(255, 230, 3);
            ellipse(0, 0, 100, 100);
            fill(0);
            ellipse(-25, 0, 15, 30);
            ellipse(25, 0, 15, 30);
            fill(200, 0, 0);
            triangle(-10, 10, 10, 10, 0, 20);
            pushMatrix();
              translate(0, 20);
              fill(255);
              triangle(-20, 0, -10, 0, -15, 20);
              triangle(20, 0, 10, 0, 15, 20);
            popMatrix();
            fill(75);
            ellipse(-25, -25, 10, 10);
            ellipse(25, -25, 10, 10);
            ellipse(25, 30, 10, 10);
            ellipse(-25, 20, 10, 10);
            ellipse(0, 40, 10, 10);
            pushMatrix();
              translate(27, -35);
              fill(255, 230, 3);
              rotate(PI/4);
              triangle(0, 0, 30, 0, 15, - 25);
            popMatrix();
            pushMatrix();
              translate(-27, -35);
              fill(255, 230, 5);
              rotate(-PI/4);
              triangle(0, 0, -30, 0, -15, -25);
            popMatrix();
           popMatrix();
         }
       }
}
