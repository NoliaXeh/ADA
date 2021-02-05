with Text_IO;         use Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Wide_Text_IO; use Ada.Float_Wide_Text_IO;
with Glib;            use Glib;
with Vector;          use Vector;
with Physics;         use Physics;
with Entity;          use Entity;
with Sprite;          use Sprite;
with Maps;            use Maps;
with Block;           use Block;

package body Game
with SPARK_Mode => Off
is
   function Game return Boolean is
      B: Block.Block;
      X: Integer;
      Y: Integer;
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




      --- [TBM] Update collision
      X := Integer(Player.Position.X) / 64;
      Y := Integer(Player.Position.Y) / 64;

      B := Maps.Get(X => X,
                    Y => Y + 1);
      Put("B: ");
      Put(B.getEntity.Position.X);
      Put(", ");
      Put(B.getEntity.Position.Y);
      Put_Line("");
      if Entity.Collides(B.getEntity, Player) then
         Player.Forces.Y := -1.0;
      end if;
      Entity.Update(Object => Player);
      --- Move all fixed to "follow" player

      Layout.Move(Child_Widget => Fixed,
                  X            => Gint(- Player.Position.X) + Win_Width / 2,
                  Y            => Gint(- Player.Position.Y) + Win_Height / 2);

      ---
      return True;
   end;
end Game;
