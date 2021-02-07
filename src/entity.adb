
with Physics;         use Physics;
with Vector;          use Vector;
with Game;            use Game;
with Block;           use Block;
with Maps;           use Maps;

package body Entity
with SPARK_Mode => Off
is

   function Collides ( Object_A: Entity; Object_B: Entity ) return Boolean is
      -- Test collision with another entity
   begin
      return Physics.Collides(A     => Object_A.HitBox,
                              A_Pos => Object_A.Position,
                              B     => Object_B.HitBox,
                              B_Pos => Object_B.Position);
   end Collides;
   
   function Collides (Object: Entity; HitBox: Physics.HitBox; Position: Vector.Vector) return Boolean is
      -- Test collision with a given HitBox at a given position
   begin
      return Physics.Collides(A     => Object.HitBox,
                              A_Pos => Object.Position,
                              B     => HitBox,
                              B_Pos => Position);
   end;
   
   function Collides (Object: Entity; Position: Vector.Vector) return Boolean is
      -- Test if the entity touches a given coordinate
   begin
      return Physics.Collides(A     => Object.HitBox,
                              A_Pos => Object.Position,
                              B_Pos => Position);
   end;

   procedure Apply_Force (Object: in out Entity; Force: in Vector.Vector) is
     -- Apply a force the the entity. Need to Update the entity to watch the result
   begin
      Object.Forces := Vector.Add(V => Object.Forces,
                                  U => Force);
   end;

   procedure Update (Object: in out Entity) is
   -- Update the Entity by
   --   - Applying Gravity   
   --   - Applying the Forces to update the Entity position
   --   - Does not update sprite position
   begin
      Apply_Force(Object, (0.0, Object.Mass * Game.Gravity * Game.Delta_Time));
      Apply_Force(Object, (-Object.Forces.X * 0.1, 0.0 * Game.Delta_Time));
      if plum.getEntity.Forces.X * plum.getEntity.Forces.X < 0.01 then
         plum.getEntity.Forces.X := 0.0;
      end if;
      if plum.getEntity.Forces.Y * plum.getEntity.Forces.Y < 0.01 then
         plum.getEntity.Forces.Y := 0.0;
      end if;
      Object.Position := Vector.Add(Object.Position, Vector.Mul(Object.Forces, Game.Delta_Time));
   end;
   
   procedure Process_Collision (Player: in out Entity) is
   -- Processes all colisions and updates entity position according to them
      B: Block.Block;
      X: Integer;
      Y: Integer;
   begin
      
      X := Integer(Player.Position.X) / 64;
      Y := Integer(Player.Position.Y) / 64;

      if Y+1 >= Game.Map.height or Y-1 < 0 then
         Player.Forces.Y := -Player.Forces.Y;
      elsif X+1 >= Game.Map.width or X-1 < 0 then
         Player.Forces.X := -Player.Forces.X;
      else
         -- Bottom Collision
         B := Maps.Get(X => Integer(Player.Position.X - 32.0) / 64,
                    Y => Y + 1);
         if B.getNature /= 2 and then Collides(B.getEntity, Player) then
            Apply_Force(Player, (0.0, -Player.Forces.Y));
            Player.Position.Y := B.getEntity.Position.Y - 62.0;
            Game.Jump_Lock := False;
         end if;
         -- Top
         B := Maps.Get(X => X,
                       Y => Y - 1);
         if B.getNature /= 2 and then Player.Position.Y <= (B.getEntity.Position.Y + B.getEntity.HitBox.Size.Y) then
            Player.Forces.Y := 2.0;
            Player.Position.Y := Player.Position.Y - (Player.Position.Y - (B.getEntity.Position.Y + B.getEntity.HitBox.Size.Y));
         else
            -- Right
            B := Maps.Get(X => X,
                          Y => Y);
            if B.getNature /= 2 and then Player.Position.X + Player.HitBox.Size.X >= (B.getEntity.Position.X) then
               Player.Forces.X := -2.0;
               Player.Position.X := Player.Position.X - (Player.Position.X + Player.HitBox.Size.X - (B.getEntity.Position.X));
            end if;
            -- Left
            B := Maps.Get(X => X - 1,
                          Y => Y);
            if B.getNature /= 2 and then Player.Position.X <= (B.getEntity.Position.X + B.getEntity.HitBox.Size.X) then
               Player.Forces.X := 2.0;
               Player.Position.X := Player.Position.X - (Player.Position.X - (B.getEntity.Position.X + B.getEntity.HitBox.Size.X));
            end if;
         end if;
      end if;
   end;
   

end Entity;
