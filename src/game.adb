with Text_IO;         use Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Wide_Text_IO; use Ada.Float_Wide_Text_IO;
with Glib;            use Glib;
with Vector;          use Vector;
with Physics;         use Physics;
with Entity;          use Entity;
with Sprite;          use Sprite;


package body Game is
   function Game return Boolean is
   begin
      ---
      Put("Player Pos: ");
      Put(Player.Position.X);
      Put(", ");
      Put(Player.Position.Y);
      Put_Line("");
      Put("Player Forces: ");
      Put(Player.Forces.X);
      Put(", ");
      Put(Player.Forces.Y);
      Put_Line("");
      Player.Mass := 100.0;
      Entity.Update(Object => Player);

      --- Move all fixed to "follow" player

      Layout.Move(Child_Widget => Fixed,
                  X            => Gint(- Player.Position.X),
                  Y            => Gint(- Player.Position.Y));

      ---
      return True;
   end;
end Game;
