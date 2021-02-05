with Glib;            use Glib;
with Gtk.Fixed;       use Gtk.Fixed;
with Gtk.Layout;      use Gtk.Layout;
with Entity;          use Entity;
with Vector;          use Vector;
with Physics;          use Physics;
with Gtk.Window;      use Gtk.Window;
package Game
with SPARK_Mode => Off
is

   function Game return Boolean;
   --- Core game loop

   Win_Width   : Gint := 1280;
   Win_Height  : Gint := 720;

   count       : Integer := 0;
   Layout      : Gtk_Layout;

   Fixed       : Gtk_Fixed;
   Fixed_Mid   : Gtk_Fixed;
   Fixed_Back  : Gtk_Fixed;
   Fixed_Front : Gtk_Fixed;
   Fixed_Entities : Gtk_Fixed;
   Win           : Gtk_Window;

   Delta_Time  : Float := 1.0 / 60.0; -- 60 FPS
   Gravity     : Float := 9.8;

   Player      : Entity.Entity := (
                      HitBox => (Size => (X => 64.0, Y => 64.0)),      -- HitBox: Physics.HitBox;
                      Position => (64.0, 64.0),                        -- Position: Vector.Vector;
                      Forces => (0.0, 0.0),                            -- Forces: Vector.Vector;
                      Mass => 1.0,                                     -- Mass: Float;
                                   Sp => --null                                       -- Sprite: Sprite.Sprite;
                                     (
                                      Image    => null,
                                      Panel    => null,
                                      Visible  => True,
                                      Position => (64.0, 64.0)
                                          )
                                     );

end Game;
