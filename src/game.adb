with Text_IO; use Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Wide_Text_IO; use Ada.Float_Wide_Text_IO;
with Glib;            use Glib;
with Vector;          use Vector;
with Physics;         use Physics;


package body Game is
   function Game return Boolean is
      A: Vector.Vector;
      B: Vector.Vector;
      HA: Physics.HitBox;
      HB: Physics.HitBox;
      Res: Boolean;
   begin
      ---
      A := (1.0, 1.0);
      B := (0.0, 2.0);
      HA.Size := (1.0, 3.0);
      HB.Size := (3.0, 1.0);

      Res := Collides(HA, A, HB, B);
      if Res then
         Put_Line("True");
      else
          Put_Line("False");
      end if;

      count := count + 1;
      Ada.Float_Wide_Text_IO.Put (A.X);
      Put(", ");
      Ada.Float_Wide_Text_IO.Put (A.Y);
      Put_Line("");
      Layout.Move (Fixed, -Gint(count), 0);
      ---
      return True;
   end;
end Game;
