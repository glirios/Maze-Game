/**
 * Explorer.java
 *
 * This class holds the key features of our explorer - the kitty kat
 *
 * @Giovanni Lirios
 * @April 30, 2015
 */
import java.awt.event.KeyEvent;

public class Explorer extends Occupant
{

        private String name;
        private Maze maze;

        public Explorer( Square location, Maze maze, String name)
        {
                super(location);
                this.name = name;
                this.maze = maze;
                maze.lookAround(super.location());
        }

        public String name()
        {
                return name;
        }

        public void move( int key )
        {
                int row = super.location().row();
                int col = super.location().col();
                int a_down = KeyEvent.VK_KP_DOWN;
                int a_up = KeyEvent.VK_KP_UP;
                int a_right = KeyEvent.VK_KP_RIGHT;
                int a_left = KeyEvent.VK_KP_LEFT;
                int b_down = KeyEvent.VK_DOWN;
                int b_up = KeyEvent.VK_UP;
                int b_right = KeyEvent.VK_RIGHT;
                int b_left = KeyEvent.VK_LEFT;

                if ( key == a_up || key == a_down || key == a_left || key == a_right ||
                     key == b_up || key == b_down || key == b_left || key == b_right)
                {
                        if( key == a_up || key == b_up )
                        {
                                if( super.location().wall(0) == false )
                                {
                                        moveTo( maze.getSquare( row - 1, col ) );
                                }
                        }

                        if( key == a_down || key == b_down )
                        {
                                if( super.location().wall(2) == false )
                                {
                                        moveTo( maze.getSquare( row + 1, col ) );
                                }
                        }
        
                        if( key == a_right || key == b_right )
                        {
                                if( super.location().wall(1) == false )
                                {
                                        moveTo( maze.getSquare( row, col + 1 ) );
                                }
                        }

                        if( key == a_left || key == b_left )
                        {
                                if( super.location().wall(3) == false)
                                {
                                        moveTo( maze.getSquare( row, col - 1 ) );
                                }
                        }
                        
                } 
        }

        public void moveTo( Square s )
        {
                super.moveTo(s);
                maze.lookAround( super.location() );
                maze.getSquare(super.location().row(), super.location().col()).enter();
        }
}
