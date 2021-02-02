
with Gtk.Fixed;       use Gtk.Fixed;
with Gtk.Layout;      use Gtk.Layout;
with Entity;          use Entity;
with Vector;          use Vector;
with Physics;          use Physics;
package Game is

   function Game return Boolean;
   --- Core game loop

   count: Integer := 0;
   Layout : Gtk_Layout;
   Fixed : Gtk_Fixed;
   Delta_Time : Float := 1.0 / 60.0; -- 60 FPS
   Gravity : Float := 9.8;
   Object : Entity.Entity := (
                      HitBox => (Size => (X => 1.0, Y => 1.0)),      -- HitBox: Physics.HitBox;
                      Position => (50.0, 250.0),      -- Position: Vector.Vector;
                      Forces => (200.0, -200.0),      -- Forces: Vector.Vector;
                      Mass => 1.0,     -- Mass: Float;
                      Sprite => null      -- Sprite: Gtk_Fixed;
                      );


end Game;
