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

   Gtk_New (Layout);

   Gtk_New (Fixed_Back);
   Gtk_New (Fixed_Mid);
   Gtk_New (Fixed_Entities);
   Gtk_New (Fixed_Front);
   Gtk_New (Fixed);
   Win.Set_Default_Size (400, 400);
   Fixed.Put (Fixed_Back, 0, 0);
   Fixed.Put (Fixed_Mid, 0, 0);
   Fixed.Put (Fixed_Entities, 0, 0);
   Fixed.Put (Fixed_Front, 0, 0);
   Layout.Put (Fixed, -10, -50);

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

   Win.add(Layout);
   Layout.Show_All;


   -- Stop the Gtk process when closing the window
   Win.On_Delete_Event (Delete_Event_Cb'Unrestricted_Access);

   --- Call game Loop
   Game.Fixed := Fixed;
   Game.Layout := Layout;

   osef := Glib.Main.Timeout_Add(Interval => 33, -- ms
                    Func     => Game.Game'Access);
   ---
   --  Show the window and present it
   Win.Show_All;
   Win.Present;

   --  Start the Gtk+ main loop
   Gtk.Main.Main;
end Main;
