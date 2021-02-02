with Vector; use Vector;

package Physics is

   type HitBox is record
      Size: Vector.Vector;
   end record with
      Dynamic_Predicate => Size.X > 0.0 and Size.Y > 0.0;
   
   function Collides (A    : HitBox;
                      A_Pos: Vector.Vector;
                      B    : HitBox;
                      B_Pos: Vector.Vector)
                      return Boolean;
   --- Test if 2 hitboxes collides at given positions
   
   function Collides (A    : HitBox;
                      A_Pos: Vector.Vector;
                      B_Pos: Vector.Vector)
                      return Boolean;
   --- Test if hitboxe collides a given position
   
   
   

end Physics;
