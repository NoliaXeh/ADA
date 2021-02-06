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
      Put_Line("--");
      Put("Pos:      ");
      Put(Player.Position.X);
      Put(", ");
      Put(Player.Position.Y);
      Put_Line("");
      Put("Forces:   ");
      Put(Player.Forces.X);
      Put(", ");
      Put(Player.Forces.Y);
      Put_Line("");
      Player.Mass := 100.0;




      --- [TBM] Update collision
      X := Integer(Player.Position.X) / 64;
      Y := Integer(Player.Position.Y) / 64;


      if Y+1 >= Map.height or Y-1 < 0 then
         Player.Forces.Y := -Player.Forces.Y;
      elsif X+1 >= Map.width or X-1 < 0 then
         Player.Forces.X := -Player.Forces.X;
      else
         -- Bottom Collision
         B := Maps.Get(X => X,
                    Y => Y + 1);
         if B.getNature /= 2 and then Entity.Collides(B.getEntity, Player) then
            Entity.Apply_Force(Player, (0.0, -Player.Forces.Y));
            Player.Position.Y := B.getEntity.Position.Y - 62.0;
         end if;
         -- Top
         B := Maps.Get(X => X,
                       Y => Y - 1);
         Put (B.getNature); Put_Line("");
         if B.getNature /= 2 and then Entity.Collides(B.getEntity, Player) then
            Put ("Ouch");
            Player.Forces.Y := 2.0;
            Player.Position.Y := B.getEntity.Position.Y + 62.0;
         end if;
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
