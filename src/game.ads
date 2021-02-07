with Glib;            use Glib;
with Gtk.Fixed;       use Gtk.Fixed;
with Gtk.Layout;      use Gtk.Layout;
with Entity;          use Entity;
with Vector;          use Vector;
with Physics;          use Physics;
with Gtk.Window;      use Gtk.Window;
with Glib;            use Glib;
with Maps; use Maps;
with Foe; use Foe;
with Player; use Player;

package Game
with SPARK_Mode => Off
is
   function Game return Boolean;
   --- Core game loop

   Win_Width   : Gint := 1280;
   Win_Height  : Gint := 720;

   count       : Integer := 0;
   Layout      : Gtk_Layout;
   Start       : Boolean;

   Fixed       : Gtk_Fixed;
   Fixed_Start : Gtk_Fixed;
   Fixed_Pause : Gtk_Fixed;
   Fixed_Mid   : Gtk_Fixed;
   Fixed_Back  : Gtk_Fixed;
   Fixed_Front : Gtk_Fixed;
   Fixed_Entities : Gtk_Fixed;
   Win           : Gtk_Window;
   Map         : Maps.Map;
   Right : Boolean := False;
   Left : Boolean := False;
   Up : Boolean := False;

   Jump_Lock : Boolean := False;

   Delta_Time  : Float := 1.0 / 60.0; -- 60 FPS
   Gravity     : Float := 9.8;

   plum : Player.Player;
   ePlayer      : Entity.Entity := (
                      HitBox => (Size => (X => 65.0, Y => 75.0)),      -- HitBox: Physics.HitBox;
                      Position => (128.0, 256.0),                        -- Position: Vector.Vector;
                      Forces => (0.0, 0.0),                            -- Forces: Vector.Vector;
                      Mass => 100.0,                                     -- Mass: Float;
                                   Sp => --null                                       -- Sprite: Sprite.Sprite;
                                     (
                                      Panel    => null,
                                      Test    => null,
                                      Visible  => True,
                                      Position => (64.0, 64.0)
                                          )
                                  );

   Mechant : Foe.Foe;

end Game;
