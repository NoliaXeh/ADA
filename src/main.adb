with Gdk.Event;       use Gdk.Event;

with Gtk.Box;         use Gtk.Box;
with Gtk.Label;       use Gtk.Label;
with Gtk.Widget;      use Gtk.Widget;
with Gtk.Main;
with Gtk.Window;      use Gtk.Window;
with Gtk.Image;       use Gtk.Image;
with Gtk.Fixed;       use Gtk.Fixed;
with Gtk.Layout;      use Gtk.Layout;

with Block; use Block;


procedure Main is

   Win   : Gtk_Window;
   Layout: Gtk_Layout;
   Fixed_Back: Gtk_Fixed;
   Fixed_Mid: Gtk_Fixed;
   Fixed_Front: Gtk_Fixed;

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
   Gtk_New (Fixed_Front);
   Win.Set_Default_Size (400, 400);
   Layout.Put(Fixed_Back, 0, 0);
   Layout.Put(Fixed_Mid, 0, 0);
   Layout.Put(Fixed_Front, 0, 0);

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

   --  Show the window and present it
   Win.Show_All;
   Win.Present;

   --  Start the Gtk+ main loop
   Gtk.Main.Main;
end Main;
