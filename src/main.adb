with Gdk.Event;       use Gdk.Event;

with Ada.Long_Float_Text_IO;
with Gtk.Box;         use Gtk.Box;
with Gtk.Label;       use Gtk.Label;
with Gtk.Widget;      use Gtk.Widget;
with Gtk.Main;
with Gtk.Window;      use Gtk.Window;
with Gtk.Image;       use Gtk.Image;
with Gtk.Fixed;       use Gtk.Fixed;
with Gtk.Layout;      use Gtk.Layout;
with Gtk.Handlers;
with Glib;            use Glib;
with Glib.Main;       use Glib.Main;
with Glib.Object; use Glib.Object;
with Ada.Text_IO; use Ada.Text_IO;

with Block; use Block;
with Game; use Game;
with Graphics; use Graphics;

with Ada.Containers.Hashed_Maps;  use Ada.Containers;
with Maps;  use Maps;
with File;  use File;
with inputEvent;  use inputEvent;
with inputEvent;  use inputEvent;

with Sprite;      use Sprite;

--TEST
WITH Gtk.Main ;          USE Gtk.Main ;
WITH Gdk.Types ;               USE Gdk.Types;
WITH Gdk.Types.Keysyms ;       USE Gdk.Types.Keysyms ;
with Gdk.Event; use Gdk.Event;

WITH Gtk.Handlers ;

procedure Main is

   Win           : Gtk_Window;
   Layout        : Gtk_Layout;
   Fixed         : Gtk_Fixed;
   Fixed_Back    : Gtk_Fixed;
   Fixed_Mid     : Gtk_Fixed;
   Fixed_Entities: Gtk_Fixed;
   Fixed_Front   : Gtk_Fixed;
   osef          : G_Source_Id;

   function Delete_Event_Cb
     (Self  : access Gtk_Widget_Record'Class;
      Event : Gdk.Event.Gdk_Event)
      return Boolean;

   ---------------------
   -- Delete_Event_Cb --
   ---------------------

   function Delete_Event_Cb
     (Self  : access Gtk_Widget_Record'Class;
      Event : Gdk.Event.Gdk_Event)
      return Boolean
   is
      pragma Unreferenced (Self, Event);
   begin
      Gtk.Main.Main_Quit;
      return True;
   end Delete_Event_Cb;
   Output:Maps.Map;

begin
   File.Read_File (Output => Output);
   Maps.print(map =>Output);
   Game.Map := Output;
   --  Initialize GtkAda.
   Gtk.Main.Init;

   --  Create a window with a size of 400x400
   Gtk_New (Win);
   Win.Set_Default_Size (Game.Win_Width, Game.Win_Height);

   --- Main Layout, only thing attafched to the Window
   Gtk_New (Layout);
   Win.add(Layout);

   --- Main Fixed, attached to Layout
   Gtk_New (Fixed);
   Gtk_New (Fixed_Back);
   Layout.Put (Fixed_Back, 0, 0);
   Layout.Put (Fixed, 0, 0);

   --- Each Layer, attached to Fixed

   Gtk_New (Fixed_Mid);
   Gtk_New (Fixed_Entities);
   Gtk_New (Fixed_Front);


   Fixed.Put (Fixed_Mid, 0, 0);
   Layout.Put (Fixed_Entities, 0, 0);
   Fixed.Put (Fixed_Front, 0, 0);


   --- Create Images in Mid, Back, and Front for testing
   --- Setup Globals for the Game Loop
   Game.Fixed := Fixed;
   Game.Fixed_Mid := Fixed_Mid;
   Game.Fixed_Back := Fixed_Back;
   Game.Fixed_Front := Fixed_Front;
   Game.Layout := Layout;

   -- Block.Place_Block(Path  => "goku.png",
   --                   X     => 128,
   --                   Y     => 128,
   --                   Fixed => Fixed_Entities);

   -- Fixed_Mid     : Gtk_Fixed;
   Graphics.fill_screen (map    => Output);
   Graphics.set_background (image    => "background.png");

   -- Stop the Gtk process when closing the window
   Win.On_Delete_Event (Delete_Event_Cb'Unrestricted_Access);


   --- Setup Globals for the Game Loop
   Game.Fixed := Fixed;
   Game.Fixed_Mid := Fixed_Mid;
   Game.Fixed_Back := Fixed_Back;
   Game.Fixed_Front := Fixed_Front;
   Game.Fixed_Entities := Fixed_Entities;
   Game.Layout := Layout;
   Game.Player.Sp := Sprite.Sprite_New ( Path   => "Pink/alienPink_stand.png",
                                         Panel  => Fixed_Entities,
                                         Size_X => 64,
                                         Size_Y => 128);
   Game.Player.Sp.Panel.Move (Game.Player.Sp.Image, Game.Win_Width / 2 - 32, Game.Win_Height / 2 - 32);
   Win.Show_All;
   Win.Present;
   --EVENT
   win.On_Key_Press_Event(Process_Key_Press'Unrestricted_Access);

   --- Setting up game Loop, ignore returned value
   --- 60 FPS => 1000/60 ms between each frames => 16ms
   osef := Glib.Main.Timeout_Add(Interval => 16, -- ms
                                 Func     => Game.Game'Access);
   ---

   --  Start the Gtk+ main loop
      --  Show the window and present it

   Gtk.Main.Main;
end Main;
