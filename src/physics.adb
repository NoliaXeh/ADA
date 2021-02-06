with Vector; use Vector;

package body Physics
with SPARK_Mode => On
is

   function Collides (A    : HitBox;
                      A_Pos: Vector.Vector;
                      B    : HitBox;
                      B_Pos: Vector.Vector)
                      return Boolean is
   --- Test if 2 hitboxes collide at given positions
   begin
      return A_Pos.X < B_Pos.X + B.Size.X and A_Pos.X + A.Size.X > B_Pos.X
         and A_Pos.Y < B_Pos.Y + B.Size.Y and A_Pos.Y + A.Size.Y > B_Pos.Y;
   end;

   -- function Collides (A    : HitBox;
   --                    A_Pos: Vector.Vector;
   --                    B    : HitBox;
   --                    B_Pos: Vector.Vector)
   --                    return Boolean is
   -- --- Test if 2 hitboxes collide at given positions
   --    A_A: Vector.Vector;
   --    A_B: Vector.Vector;
   --    -- A_C: Vector.Vector;
   --    A_D: Vector.Vector;
   --    B_A: Vector.Vector;
   --    B_B: Vector.Vector;
   --    B_C: Vector.Vector;
   --    B_D: Vector.Vector;
   --    Number: Integer;
   -- begin
   --    A_A := A_Pos;
   --    A_B := Add(A_A, (0.0, A.Size.Y));
   --    -- A_C := Add(A_A, (A.Size.X, A.Size.Y));
   --    A_D := Add(A_A, (A.Size.X, 0.0));
   --    B_A := B_Pos;
   --    B_B := Add(B_A, (0.0, B.Size.Y));
   --    B_C := Add(B_A, (B.Size.X, B.Size.Y));
   --    B_D := Add(B_A, (B.Size.X, 0.0));

   --    Number := 0;

   --    if B_A.X > A_A.X and B_A.X < A_D.X then
   --       Number := Number + 1;
   --    end if;

   --    if B_B.X > A_A.X and B_B.X < A_D.X then
   --       Number := Number + 1;
   --    end if;

   --    if B_C.X > A_A.X and B_C.X < A_D.X then
   --       Number := Number + 1;
   --    end if;

   --    if B_D.X > A_A.X and B_D.X < A_D.X then
   --       Number := Number + 1;
   --    end if;

   --    if B_A.Y > A_A.Y and B_A.Y < A_B.Y then
   --       Number := Number + 1;
   --    end if;

   --    if B_B.Y > A_A.Y and B_B.Y < A_B.Y then
   --       Number := Number + 1;
   --    end if;

   --    if B_C.Y > A_A.Y and B_C.Y < A_B.Y then
   --       Number := Number + 1;
   --    end if;

   --    if B_D.Y > A_A.Y and B_D.Y < A_B.Y then
   --       Number := Number + 1;
   --    end if;

   --    return Number >= 3;
   -- end;

   function Collides (A    : HitBox;
                      A_Pos: Vector.Vector;
                      B_Pos: Vector.Vector)
                      return Boolean is
   --- Test if hitbox collides a given position
      Pos : Vector.Vector;
   begin
      Pos := Sub(B_Pos, A_Pos);
      return Pos.X < A.Size.X and Pos.Y < A.Size.Y and Pos.X > 0.0 and Pos.Y > 0.0;
   end;


end Physics;
