/**
 * DrawableTreasure.java
 *
 * This class is to help draw the treasure    
 *
 * @Giovanni Lirios
 * @April, 2015
 */

public class DrawableTreasure extends Treasure implements Drawable
{
        public DrawableTreasure( Maze maze )
        {
                super( maze );
        }
        
        public DrawableTreasure( Maze maze, long seed )
        {
                super( maze, seed );
        }
        
        public DrawableTreasure( Maze maze, Square location )
        {
                super( maze, location );
        }

        public void draw()
        {
          if(super.location().inView() == true)
          {
           pushMatrix();
             translate(super.location().x() + 25, super.location().y() + 25);
             if(super.found() == false )
             {
               fill(100);
               ellipse(0, 0, 25, 35);
             }
             if(super.found() == true )
             {
               fill( 100, 0, 100);
               ellipse(0, 0, 25, 35);
               fill(0);
               rect(-3, -10, 5, 5);
             }
           popMatrix();
          }
        }
}
