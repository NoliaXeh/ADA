with Gtk.Image;       use Gtk.Image;
with Gdk.Pixbuf;      use Gdk.Pixbuf;
with Gtk.Fixed;       use Gtk.Fixed;
with Gtk.Window;      use Gtk.Window;
with Glib;            use Glib;
with Glib.Error;      use Glib.Error;
with Gtk.Layout;      use Gtk.Layout;


package body Block is
   procedure Place_Block ( Path: String; X: Gint; Y: Gint; Fixed: Gtk_Fixed) is
      Img: Gtk_Image;
      Buf: Gdk_Pixbuf;
      er: Glib.Error.GError;
   begin
      Gdk_New_From_File (Buf, path, er);
      Buf := Scale_Simple(Src         => Buf,
                          Dest_Width  => 128,
                          Dest_Height => 128,
                          Inter_Type  => Interp_Bilinear);
      Gtk_New (Img, Buf);
      Fixed.Put(Widget => Img,
                 X      => X,
                 Y      => Y);
   end;
end Block;
