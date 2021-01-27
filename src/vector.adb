
with Ada.Numerics.Generic_Elementary_Functions; use Ada.Numerics.Generic_Elementary_Functions;


package body Vector is

   function Normalize (V: Vector) return Vector is
      Result: Vector;
      S: Double;
   begin
      S := Size(V);
      Result := Mul(V, 1.0/S);
      return Result;
   end;
   
   function Size (V: Vector) return Double is
      Result: Double;
   begin
      Result := Double(Sqrt(Float(V.X**2 + V.Y**2)));
      return Result;
   end;
   
   function Apply (V: Vector, U: Vector, X: Double) return Vector is
   -- Returns a vector being the linear application of V + X*U
   begin
      return Add (V, Mul (U, X));
   end;
   
   function Add (V: Vector, U: Vector) return Vector is
   -- Returns a vector being the linear addition of V + U 
   begin
      return Vector(V.X + U.X, V.Y + U.Y);
   end;
   

   function Add (V: Vector, X: Double) return Vector is
   -- Returns a vector being the linear addition of V + (1, 1) * X
   begin
      return Vector(V.X + X, V.Y + X);
   end;
   
   function Mul (V: Vector, X: Double) return Vector is
   -- Returns a vector being the linear addition of (0, 0) + V * X
   begin
      return Vector(V.X * X, V.Y * X);
   end;
      
   
   function Dot (V: Vector, U: Vector) return Double is
   -- Returns a double being the dot product V . U
   begin
      return V.X * U.X + V.Y * U.Y;
   end;
   
   
   function Prod (V: Vector, U: Vector) return Vector is
   -- Returns a Vector being the Matrix Product V ^ U
   begin
      return Vector ( V.Y * U.X - V.X - U.Y, V.X * U.Y - V.Y * U.X );
   end;


end Vector;
