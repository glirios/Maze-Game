/**
 * Monster.java
 *
 * This class holds the feature for our monster - the bulldog
 *
 * @Giovanni Lirios
 * @April 30, 2015
 */

public class Monster extends RandomOccupant
{
        public Monster( Maze maze)
        {
                super(maze);
        }

        public Monster( Maze maze, long seed)
        {
                super(maze, seed);
        }

        public Monster( Maze maze, Square location )
        {
                super(maze, location);
        }
}

