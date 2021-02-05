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
      Put_Line("Game Loop");
      Player.Mass := 0.0;
      Entity.Update(Object => Player);

      --- Move all fixed to "follow" player

      ---
      return True;
   end;
end Game;
