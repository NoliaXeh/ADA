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
with Anime; use Anime;

with Block; use Block;
with Game; use Game;
with Graphics; use Graphics;

with Ada.Containers.Hashed_Maps;  use Ada.Containers;
with Maps;  use Maps;
with File;  use File;
with inputEvent;  use inputEvent;
with inputEvent;  use inputEvent;

with Sprite;      use Sprite;

with Foe; use Foe;

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
   Fixed_Start   : Gtk_Fixed;
   Fixed_Pause   : Gtk_Fixed;
   osef          : G_Source_Id;
   osefIsBack          : G_Source_Id;

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
   File.Read_File (Path => "src/map.txt", Output => Output);
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
   Gtk_New (Fixed_Start);
   Gtk_New (Fixed_Pause);


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
   Graphics.set_image (panel => Fixed_Back, image    => "background.png");
   Graphics.set_image (panel => Fixed_Start, image    => "background.png");
   Graphics.set_image (panel => Fixed_Start, image    => "Start.png");
   Graphics.set_image (panel => Fixed_Pause, image    => "Pause.png");
   Layout.Put(Child_Widget => Fixed_Start,
              X            => 0,
              Y            => 0);
   Layout.Put(Child_Widget => Fixed_Pause,
              X            => 0,
              Y            => 0);

   -- Stop the Gtk process when closing the window
   Win.On_Delete_Event (Delete_Event_Cb'Unrestricted_Access);


   --- Setup Globals for the Game Loop
   Game.Fixed := Fixed;
   Game.Fixed_Mid := Fixed_Mid;
   Game.Fixed_Back := Fixed_Back;
   Game.Fixed_Front := Fixed_Front;
   Game.Fixed_Entities := Fixed_Entities;
   Game.Fixed_Start := Fixed_Start;
   Game.Fixed_Pause := Fixed_Pause;
   Game.Start := False;
   Game.Layout := Layout;
   Game.ePlayer.Sp := Sprite.Sprite_New ( Path   => "Pink/hitbox.png", --"Pink/alienPink_stand.png",
                                         Panel  => Fixed_Entities,
                                         Size_X => 64,
                                         Size_Y => 128);
   Game.ePlayer.Sp.Panel.Move (Game.ePlayer.Sp.Test, Game.Win_Width / 2, Game.Win_Height / 2 -64);
   Game.ePlayer.Position := (128.0, 128.0);
   Game.ePlayer.Forces := (1.0, 0.0);
   Game.Delta_Time := 0.0;

   Game.Mechant.initSpriteList;
   Game.Mechant.setPosition((20.0 * 64.0, 128.0));


   Win.Show_All;
   Win.Present;
   Fixed_Pause.Set_Visible(False);
   Game.plum.setDisplayedSprite(1);
   --EVENT
   win.On_Key_Press_Event(Process_Key_Press'Unrestricted_Access);
   win.On_Key_Release_Event(Process_Key_Release'Unrestricted_Access);




   --- Setting up game Loop, ignore returned value
   --- 60 FPS => 1000/60 ms between each frames => 16ms
   osef := Glib.Main.Timeout_Add(Interval => 16, -- ms
                                 Func     => Game.Game'Access);
   ---
   osefIsBack := Glib.Main.Timeout_Add(Interval => 128, -- ms
                                 Func     => Anime.Anime'Access);
   --  Start the Gtk+ main loop
      --  Show the window and present it

   Gtk.Main.Main;
end Main;
