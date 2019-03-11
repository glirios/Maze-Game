/**
 * DrawableMaze.java
 *
 * This class is to help draw the maze    
 *
 * @Giovanni Lirios
 * @April 30, 2015
 */

public class DrawableMaze extends Maze implements Drawable
{
        public DrawableMaze( DrawableSquare [][] maze, int rows, int cols )
        {
                super( maze, rows, cols );
        }

        public void draw()
        {
          fill(0);
          rect(0,0, super.rows() * 50, super.cols() * 50);
          
          for(int r = 0; r < super.rows(); r++)
          {
            for( int c = 0; c < super.cols(); c++)
            {
              DrawableSquare ds = (DrawableSquare) super.getSquare(r, c);
              ds.draw();            
            }
          }
          
          for( int i = 0; i < super.getNumRandOccupants(); i++ )
          {
            if( getRandomOccupant(i) instanceof Monster )
            {
              DrawableMonster dm = (DrawableMonster) super.getRandomOccupant(i);
              dm.draw();

            }
            else
            {
              DrawableTreasure dt = (DrawableTreasure) super.getRandomOccupant(i);
              dt.draw();
            }
          }
          
          DrawableExplorer de = (DrawableExplorer) super.getExplorer();
          de.draw();
        }
}
