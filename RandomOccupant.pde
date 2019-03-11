/**
 * RandomOccupant.java
 *
 * This class holds the key features for a random occupant
 *
 * @Giovanni Lirios
 * @April 30, 2015
 */

import java.util.*;

public abstract class RandomOccupant extends Occupant
{
        private Random ran = new Random();
        private Maze maze;

        public RandomOccupant( Maze maze)
        {
                super( maze.getSquare(0,0) );
                super.moveTo(maze.getSquare(ran.nextInt(maze.rows()), ran.nextInt(maze.cols())));
                this.maze = maze;
        }

        public RandomOccupant( Maze maze, long seed )
        {
                super( maze.getSquare(0,0) );
                ran = new Random( seed );
                super.moveTo(maze.getSquare(ran.nextInt(maze.rows()), ran.nextInt(maze.cols())));
                this.maze = maze;
        }

        public RandomOccupant( Maze maze, Square location )
        {
                super(location);
                this.maze = maze;
        }

        public void move()
        {
		int row = super.location().row();
		int col = super.location().col();
		int dir = ran.nextInt(4);

		while( super.location().wall(dir) == true )
		{	
			dir = ran.nextInt(4);
		}

		if( dir == super.location().UP )
		{
			super.moveTo( maze.getSquare( row - 1, col ) );
		}

		if( dir == super.location().DOWN )
		{
			super.moveTo( maze.getSquare( row + 1, col ) );
		}
		if( dir == super.location().RIGHT )
		{
			super.moveTo( maze.getSquare( row, col + 1 ) );
		}
		if( dir == super.location().LEFT )
		{
			super.moveTo( maze.getSquare( row, col - 1 ) );
		}
        }

}
