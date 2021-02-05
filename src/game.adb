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
      count := count + 1;
      --Sprite.Move (Player.Sp, Player.Position);
      Sprite.Move (Player.Sp, (300.0, 300.0));
      ---
      return True;
   end;
end Game;
