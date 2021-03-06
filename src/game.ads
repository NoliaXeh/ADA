with Glib;            use Glib;
with Gtk.Fixed;       use Gtk.Fixed;
with Gtk.Layout;      use Gtk.Layout;
with Gtk.Label;      use Gtk.Label;
with Entity;          use Entity;
with Vector;          use Vector;
with Physics;          use Physics;
with Gtk.Window;      use Gtk.Window;
with Glib;            use Glib;
with Maps; use Maps;
with Foe; use Foe;
with Player; use Player;
with  Ada.Containers.Vectors;
package Game
with SPARK_Mode => Off
is
   function Game return Boolean;
   --- Core game loop

   Win_Width      : Gint := 1280;
   Win_Height     : Gint := 720;

   count          : Integer := 0;
   Layout         : Gtk_Layout;
   Start          : Boolean;

   Fixed          : Gtk_Fixed;
   Fixed_Start    : Gtk_Fixed;
   Fixed_Pause    : Gtk_Fixed;
   Fixed_Win      : Gtk_Fixed;
   Fixed_Loose    : Gtk_Fixed;
   Fixed_Mid      : Gtk_Fixed;
   Fixed_Back     : Gtk_Fixed;
   Fixed_Front    : Gtk_Fixed;
   Fixed_Entities : Gtk_Fixed;
   Life           : Gtk_Label;
   Win            : Gtk_Window;
   Map            : Maps.Map;
   isWin          : Boolean := False;
   Right          : Boolean := False;
   Left           : Boolean := False;
   Up             : Boolean := False;

   Jump_Lock      : Boolean := False;

   Delta_Time     : Float := 1.0 / 60.0; -- 60 FPS
   Gravity        : Float := 9.8;

   plum           : Player.Player;
   Mechant        : Foe.Foe;

   package Foe_List_Type is new Ada.Containers.Vectors
      (Index_Type   => Natural,
       Element_Type => Foe.Foe,
       "="          => Foe."=");
   Foe_List : Foe_List_Type.Vector;
   -- Foe_List.Append
   -- Foe_List.Clear

end Game;
