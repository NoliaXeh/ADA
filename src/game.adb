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
   begin
      ---
      if Right then
         Entity.Apply_Force(plum.getEntity, (100.0, 0.0));
      end if;
      if Left then
         Entity.Apply_Force(plum.getEntity, (-100.0, 0.0));
      end if;

      Entity.Process_Collision (plum.getEntity);

      if Up and not Jump_Lock then
         Entity.Apply_Force(plum.getEntity, (0.0, -500.00));
         Jump_Lock := True;
      end if;

      Entity.Update(Object => plum.getEntity);
      Mechant.Update;

      if Entity.Collides(plum.getEntity, Mechant.getEntity) then
         Put (Integer(plum.getHp));
         Put_line("");
         plum.setHp(plum.getHp - 1.0);
      end if;

      --- Move all fixed to "follow" player
      Layout.Move(Child_Widget => Fixed,
                  X            => Gint(- plum.getEntity.Position.X + 64.0) + Win_Width / 2,
                  Y            => Gint(- plum.getEntity.Position.Y) + Win_Height / 2);

      ---
      if plum.getHp = 0.0 then
         return False;
      end if;
      return True;
   end;
end Game;
