with Text_IO;         use Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Wide_Text_IO; use Ada.Float_Wide_Text_IO;
with Glib;            use Glib;
with Vector;          use Vector;
with Physics;         use Physics;
with Entity;          use Entity;


package body Game is
   function Game return Boolean is
   begin
      ---
      Entity.Update(Object => Object);
      count := count + 1;
      Layout.Move (Fixed, Gint(Object.Position.X), Gint(Object.Position.Y));
      if Object.Position.Y > 380.0 then
         Object.Forces.Y := - 0.9 * Object.Forces.Y;
      end if;
      ---
      return True;
   end;
end Game;
