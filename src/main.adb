with Gdk.Event;       use Gdk.Event;
with Gtk.Box;         use Gtk.Box;
with Gtk.Label;       use Gtk.Label;
with Gtk.Widget;      use Gtk.Widget;
with Gtk.Main;
with Gtk.Window;      use Gtk.Window;
with Gtk.Image;       use Gtk.Image;
with Gtk.Fixed;       use Gtk.Fixed;
with Gtk.Layout;      use Gtk.Layout;
with Glib;            use Glib;
with Glib.Main;       use Glib.Main;

with Block; use Block;
with Game; use Game;

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

begin

   --  Initialize GtkAda.
   Gtk.Main.Init;

   --  Create a window with a size of 400x400
   Gtk_New (Win);
   Win.Set_Default_Size (400, 400);

   --- Main Layout, only thing attafched to the Window
   Gtk_New (Layout);
   Win.add(Layout);

   --- Main Fixed, attached to Layout
   Gtk_New (Fixed);
   Layout.Put (Fixed, -10, -50);

   --- Each Layer, attached to Fixed
   Gtk_New (Fixed_Back);
   Gtk_New (Fixed_Mid);
   Gtk_New (Fixed_Entities);
   Gtk_New (Fixed_Front);

   Fixed.Put (Fixed_Back, 0, 0);
   Fixed.Put (Fixed_Mid, 0, 0);
   Fixed.Put (Fixed_Entities, 0, 0);
   Fixed.Put (Fixed_Front, 0, 0);


   --- Create Images in Mid, Back, and Front for testing


   Block.Place_Block(Path => "goku.png",
                     X    => 0,
                     Y    => 0,
                     Fixed  => Fixed_Mid);
   Block.Place_Block(Path => "img.png",
                     X    => 0,
                     Y    => 0,
                     Fixed  => Fixed_Back);
   Block.Place_Block(Path => "trans.png",
                     X    => 0,
                     Y    => 0,
                     Fixed  => Fixed_Front);

   -- Stop the Gtk process when closing the window
   Win.On_Delete_Event (Delete_Event_Cb'Unrestricted_Access);
   --  Show the window and present it
   Win.Show_All;
   Win.Present;

   --- Setup Globals for the Game Loop
   Game.Fixed := Fixed;
   Game.Layout := Layout;
   --- Setting up game Loop, ignore returned value
   --- 60 FPS => 1000/60 ms between each frames => 16ms
   osef := Glib.Main.Timeout_Add(Interval => 16, -- ms
                                 Func     => Game.Game'Access);
   ---

   --  Start the Gtk+ main loop
   Gtk.Main.Main;
end Main;
