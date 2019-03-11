/**
 * Sqaure.java

 *
 * This class represents the square logistics
 *
 * @Giovanni Lirios
 * @April 30, 2015
 */

public class Square
{
        public static final int SQUARE_SIZE = 50; // number of pixels per square
        public static final int UP = 0;
        public static final int RIGHT = 1;
        public static final int DOWN = 2;
        public static final int LEFT = 3;

        private boolean [] walls = new boolean [4];
        private boolean seen;
        private boolean inView;
        private int row;
        private int col;
        private Treasure treasure;

        public Square( boolean up, boolean right, boolean down, boolean left, int row, int col)
        {
                walls[0] = up;
                walls[1] = right;
                walls[2] = down;
                walls[3] = left;
                this.row = row;
                this.col = col;
        }
        
        public boolean seen()
        {
                return seen;
        }
        
        public boolean inView()
        {
                return inView;
        }
        
        public int row()
        {
                return row;
        }

        public int col()
        {
                return col;
        }

        public Treasure treasure()
        {
                return treasure;
        }

        public boolean wall( int direction )
        {
                return walls[ direction ];
        }

        public int x()
        {
                return col * SQUARE_SIZE;
        }

        public int y()
        {
                return row * SQUARE_SIZE;
        }

        public void setInView( boolean inView )
        {
                this.inView = inView;
                if(inView == true)
                {
                        this.seen = true;
                }
        }
        
        public void setTreasure( Treasure t )
        {
                treasure = t;
        }

        public void enter()
        {
                if( treasure != null)
                {
                        treasure.setFound();
                }
        }
}

