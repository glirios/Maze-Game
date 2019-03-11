import java.util.*;

/**
 * Class that contains all the logic to model a Maze with Treasures, Monsters, and an Explorer.
 * 
 * @Giovanni Lirios 
 * @Version 1.0
 */
public class Maze
{
   // named constants
   public static final int ACTIVE = 0;
   public static final int EXPLORER_WIN = 1;
   public static final int MONSTER_WIN = 2;
    
    // instance variables
   private Square[][] squares;
   private ArrayList<RandomOccupant> randOccupants;
   private Explorer explorer;
   private int rows;
   private int cols;

   /**
    * Constructor for objects of class Maze
    */
   public Maze(Square[][] squares, int rows, int cols)
   {
      // - initialize the squares, rows, and cols instance variables to
      //          what is passed in to the constructor
                
      //- create the empty ArrayList of RandomOccupants
                
        this.squares = squares;
        this.rows = rows;
        this.cols = cols;
        randOccupants = new ArrayList<RandomOccupant>();
   }
        
   // QUERIES
   public Square getSquare(int row, int col) { return squares[row][col]; }
   public int rows() {return rows;}
   public int cols() {return cols;}
   public String explorerName() {return explorer.name();}
   public Explorer getExplorer() {return explorer;}
    
   // - Implement the following two methods.  I have them stubbed to return dummy values just so it will compile.
   //          Your getRandomOccupant should return the occupant from the ArrayList at the specified index.
   public RandomOccupant getRandomOccupant(int index) {return randOccupants.get(index);}
   public int getNumRandOccupants() {return randOccupants.size();}
        
   // COMMANDS
   // - implement the following method
   public void addRandomOccupant(RandomOccupant ro) { randOccupants.add(ro); }
        
   public void setExplorer(Explorer e) {explorer = e;}
        
   public void explorerMove(int key)
   {
      explorer.move(key);
   }
        
   public void randMove()
   {
      //- instruct each object in the RandomOccupant to move
        for(RandomOccupant ro: randOccupants)
        {
                ro.move();
        }
   }
        
   /**
    * Returns the status of the game.
    *
    * If all treasures have been found, return EXPLORER_WIN.
    * If not, check each maze occupant, if it is a Monster and
    *    it is in the same location as the Explorer, return
    *    MONSTER_WIN.  Note that you can use == to check locations, do you know why?
    * Otherwise, return ACTIVE.
    */
   public int gameStatus()
   {
        int status = ACTIVE;
        
      //  - implement
        if( foundAllTreasures() == true )
        {
                status = EXPLORER_WIN;
        }

        for(RandomOccupant ro: randOccupants)
        {
                if( ro instanceof Monster )
                {       
                        Monster mon = (Monster) ro;
                        
                        if( explorer.location() == mon.location() )
                        {
                                status = MONSTER_WIN;
                        }
                }
        }
        return status;
   }
        
   private boolean foundAllTreasures()
   {
        boolean foundAll = true;
        
      //  - search through all the occupants to see if the Treasures have been found.  Return false if
      //        - there is a Treasure that hasn't been found.
      
        for( int i = 0; i < randOccupants.size(); i++ )
        {
                if( randOccupants.get(i) instanceof Treasure)
                {
                        Treasure t = (Treasure) randOccupants.get(i);
                        if( t.found() == false )
                        {       
                                foundAll = false;
                        }
                }
        }
              
        return foundAll;
   }
    
   public void lookAround(Square s)
   {
        int row = s.row();
        int col = s.col();
        
      // Clear what was previously in view
        resetInView();
        
      // Set the current square so that we are viewing it (obviously)
        s.setInView(true);
        
      //  - Check the adjacent squares.  If there isn't a wall in the way, set their inview to true.
      //        - Check the diagonal squares.  If there isn't a wall in the way, set their inview to true.
        if( row - 1 >= 0 && s.wall(s.UP) == false )
        {
                this.getSquare( row - 1, col ).setInView( true );
                
                if( col - 1 >= 0 && getSquare( row - 1, col).wall(s.LEFT) == false )
                {
                        this.getSquare( row - 1, col - 1 ).setInView( true );
                }
                if( col + 1 < cols() && getSquare( row - 1, col).wall(s.RIGHT) == false )
                {
                        this.getSquare( row - 1, col + 1 ).setInView( true );
                } 
        }
        if( row + 1 < rows() && s.wall(s.DOWN) == false )
        {
                this.getSquare( row + 1, col ).setInView( true ); 

                if( col - 1 >= 0 && getSquare( row + 1, col).wall(s.LEFT) == false )
                {
                        this.getSquare( row + 1, col - 1 ).setInView( true );
                }
                if( col + 1 < cols() && getSquare( row + 1, col).wall(s.RIGHT) == false )
                {
                        this.getSquare( row + 1, col + 1 ).setInView( true );
                }
        }
        if( col - 1 >= 0 && s.wall(s.LEFT) == false )
        {
                this.getSquare( row, col - 1).setInView( true ); 

                if( row - 1 >= 0 && getSquare( row, col - 1).wall( s.UP ) == false ) 
                {
                        this.getSquare( row - 1 , col - 1 ).setInView( true );
                }
                if( row + 1 < rows() && getSquare( row, col - 1 ).wall( s.DOWN ) == false ) 
                {
                        this.getSquare( row + 1, col - 1 ).setInView( true );
                }
        }
        if( col + 1 < cols() && s.wall(s.RIGHT) == false )
        {
                this.getSquare( row, col + 1).setInView( true ); 

                if( row - 1 >= 0 && getSquare( row, col + 1).wall( s.UP ) == false )
                {
                        this.getSquare( row - 1 , col + 1 ).setInView(true);
                }
                if( row + 1 < rows() && getSquare( row, col + 1 ).wall( s.DOWN ) == false )
                {
                        this.getSquare( row + 1, col + 1 ).setInView(true);
                }
        }
   }
        
   private void resetInView()
   {
        for (int i = 0; i<rows; i++) 
        {
                for (int j = 0; j<cols; j++) 
                {
                        squares[i][j].setInView(false);
                }
        }
   }
}

