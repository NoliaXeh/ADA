with Physics;         use Physics;
with Vector;          use Vector;
with Gtk.Fixed;       use Gtk.Fixed;
with Sprite;          use Sprite;

package Entity
with SPARK_Mode => Off -- SPRITE
is

   type Entity is record
      HitBox: Physics.HitBox;
      Position: Vector.Vector;
      Forces: Vector.Vector;
      Mass: Float;
      Sp: Sprite.Sprite;
   end record;

   function Collides ( Object_A: Entity; Object_B: Entity ) return Boolean;
   -- Test collision with another entity
   function Collides (Object: Entity; HitBox: Physics.HitBox; Position: Vector.Vector) return Boolean;
   -- Test collision with a given HitBox at a given position
   function Collides (Object: Entity; Position: Vector.Vector) return Boolean;
   -- Test if the entity touches a given coordinate

   procedure Apply_Force (Object: in out Entity; Force: in Vector.Vector);
   -- Apply a force the the entity. Need to Update the entity to watch the result

   procedure Update (Object: in out Entity);
   -- Update the Entity by
   --   - Applying the Forces to update the Entity position
   --   - Does not update sprite position

   procedure Process_Collision (Player: in out Entity);
   -- Processes all colisions and updates entity position according to them

end Entity;
