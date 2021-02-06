with Maps; use Maps;
with Gtk.Fixed;       use Gtk.Fixed;
with Gtk.Image;       use Gtk.Image;
with Gdk.Pixbuf; use Gdk.Pixbuf;
with Game; use Game;
with block; use block;
with Glib.Error;      use Glib.Error;
package body Graphics
with SPARK_Mode => Off -- GTK
is
   procedure fill_screen(map: in Maps.Map) is
   begin
      Maps.fill_screen(map);
   end fill_screen;
   procedure set_image(panel : Gtk_Fixed; image: in String) is 
      img : Gtk_Image;
      Buf : Gdk_Pixbuf;
      er: Glib.Error.GError;
   begin
      Gdk_New_From_File (Buf, image, er);
      Buf := Scale_Simple(Src         => Buf,
                          Dest_Width  => Game.Win_Width,
                          Dest_Height => Game.Win_Height,
                          Inter_Type  => Interp_Bilinear);
      Gtk_New (Img, Buf);
      panel.Put(Widget => img,
                 X      => 0,
                 Y      => 0);
   end set_image;

end Graphics;
