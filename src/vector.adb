
with Ada.Numerics.Elementary_Functions;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package body Vector
with SPARK_Mode => On
is

   function Normalize (V: Vector) return Vector is
      Result: Vector;
      S: Float;
   begin
      S := Size(V);
      Result := Mul(V, 1.0/S);
      return Result;
   end;
   
   function Size (V: Vector) return Float is
      Result: Float;
   begin
      Result := Ada.Numerics.Elementary_Functions.Sqrt(V.X**2 + V.Y**2);
      return Result;
   end;
   
   function Apply (V: Vector; U: Vector; X: Float) return Vector is
   -- Returns a vector being the linear application of V + X*U
   begin
      return Add (V, Mul (U, X));
   end;
   
   function Add (V: Vector; U: Vector) return Vector is
   -- Returns a vector being the linear addition of V + U 
   begin
      return (V.X + U.X, V.Y + U.Y);
   end;
   

   function Add (V: Vector; X: Float) return Vector is
   -- Returns a vector being the linear addition of V + (1, 1) * X
   begin
      return (V.X + X, V.Y + X);
   end;
   
   function Sub (V: Vector; U: Vector) return Vector is
   -- Returns a vector being the linear substract of V - U 
   begin
      return (V.X - U.X, V.Y - U.Y);
   end;
   

   function Sub (V: Vector; X: Float) return Vector is
   -- Returns a vector being the linear substract of V - (1, 1) * X
   begin
      return (V.X - X, V.Y - X);
   end;
   
   function Mul (V: Vector; X: Float) return Vector is
   -- Returns a vector being the linear addition of (0, 0) + V * X
   begin
      return (V.X * X, V.Y * X);
   end;
      
   
   function Dot (V: Vector; U: Vector) return Float is
   -- Returns a Float being the dot product V . U
   begin
      return V.X * U.X + V.Y * U.Y;
   end;
   
   
   function Prod (V: Vector; U: Vector) return Vector is
   -- Returns a Vector being the Matrix Product V ^ U
   begin
      return ( V.Y * U.X - V.X - U.Y, V.X * U.Y - V.Y * U.X );
   end;
   
   procedure Put (V: Vector) is
   begin
      Put ("(");
      Put (Integer(V.X));
      Put (", ");
      Put (Integer(V.Y));
      Put (")");
   end;

   procedure Put_Line (V: Vector) is
   begin
      Put (V);
      Put_Line("");
   end;

end Vector;
