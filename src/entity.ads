with Physics;         use Physics;
with Vector;          use Vector;
with Gtk.Fixed;       use Gtk.Fixed;

package Entity is

   type Entity is record
      HitBox: Physics.HitBox;
      Position: Vector.Vector;
      Forces: Vector.Vector;
      Mass: Float;
      Life: Integer;
      Max_Life: Integer;
      Alive: Boolean;
      Sprite: Gtk_Fixed;
   end Entity;

   function Collides ( Object_A: Entity; Object_B: Entity ) return Boolean;
   -- Test collision with another entity
   function Collides (Object: Entity; HitBox: Physics.HitBox; Position: Vector.Vector) return Boolean;
   -- Test collision with a given HitBox at a given position
   function Collides (Object: Entity; Position: Vector.Vector) return Boolean;
   -- Test if the entity touches a given coordinate

   procedure Apply_Force (Object: Entity; Force: Vector.Vector);
   -- Apply a force the the entity. Need to Update the entity to watch the result
   procedure Kill (Object: Entity);
   -- Kill the entity by setting Entity.Alive to False.

   function Update (Object: Entity) return Boolean;
   -- Update the Entity by:
   --   - Testing the entity life. If Life < 0 => Alive := False
   --   - Testing the entity life. If Life > Max_Life => Life := Max_Life
   --   - Applying the Forces to update the Entity position
   --   - Does not update sprite position
end Entity;
