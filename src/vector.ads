package Vector is

   type Vector is record
      X, Y: Double;
   end record;
   
   function Normalize (V: Vector) return Vector
   -- Returns a vector with same direction and length 1 
     with
       Pre => V.X /= 0 and V.Y /= 0,
       Post => ( Normalize'Result.X * Normalize'Result.X + Normalize'Result.Y * Normalize'Result.Y ) - 1 <  0.00001 -- For precision  
           and ( Normalize'Result.X * Normalize'Result.X + Normalize'Result.Y * Normalize'Result.Y ) - 1 > -0.00001;
   
   function Size (V: Vector) return Double
   -- Returns the Size of the Vector
     with 
       Post => ( Size'Result * Size'Result ) - ( V.X * V.X + V.Y * V.Y ) < 0.00001; 
   
   function Apply (V: Vector, U: Vector, X: Double) return Vector
   -- Returns a vector being the linear application of V + X*U
     with
       Post => Apply'Result.X = V.X + U.X + X
           and Apply'Result.Y = V.Y + U.Y + X;
   
   function Add (V: Vector, U: Vector) return Vector
   -- Returns a vector being the linear addition of V + U 
     with
       Post => Add'Result.X = V.X + U.X
           and Add'Result.Y = V.Y + U.Y;

   function Add (V: Vector, X: Double) return Vector
   -- Returns a vector being the linear addition of V + (1, 1) * X
     with
       Post => Add'Result.X = V.X + 1 * X
           and Add'Result.Y = V.Y + 1 * X;
   
   function Mul (V: Vector, X: Double) return Vector
   -- Returns a vector being the linear addition of (0, 0) + V * X
     with
       Post => Mul'Result.X = V.X * X
           and Mul'Result.Y = V.Y * X;
   
   function Dot (V: Vector, U: Vector) return Double
   -- Returns a double being the dot product V . U
     with
       Post => Dot'Result = V.X * U.X + V.Y * U.Y;
   
   function Prod (V: Vector, U: Vector) return Vector
   -- Returns a Vector being the Matrix Product V ^ U
     with
       Post => Prod'Result.X = V.Y * U.X - V.X * U.Y
           and Prod'Result.Y = V.X * U.Y - V.Y * U.X;

end Vector;
