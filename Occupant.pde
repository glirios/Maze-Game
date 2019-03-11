/**
 * Occupant.java
 *
 * This class is an abstract class of an occupant
 *
 * @Giovanni Lirios
 * @April 30, 2015
 */

public abstract class Occupant
{
        private Square s;

        public Occupant()
        {
        }

        public Occupant(Square start)
        {
                s = start;
        }

        public Square location()
        {
                return s;
        }

        public void moveTo(Square newLoc)
        {
                s = newLoc;
        }
}
