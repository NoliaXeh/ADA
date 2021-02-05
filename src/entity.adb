
with Physics;         use Physics;
with Vector;          use Vector;
with Game;            use Game;

package body Entity is

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
      Object.Position := Vector.Add(Object.Position, Vector.Mul(Object.Forces, Game.Delta_Time));
   end;
   
   

end Entity;
