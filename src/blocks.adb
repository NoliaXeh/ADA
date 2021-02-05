with Gtk.Image;       use Gtk.Image;
with Gdk.Pixbuf;      use Gdk.Pixbuf;
with Gtk.Fixed;       use Gtk.Fixed;
with Gtk.Window;      use Gtk.Window;
with Glib;            use Glib;
with Glib.Error;      use Glib.Error;
with Gtk.Layout;      use Gtk.Layout;
with Game; use Game;


package body Blocks is
   procedure Place_Block ( Path: String; X: Gint; Y: Gint; Fixed: Gtk_Fixed) is
      Img: Gtk_Image;
      Buf: Gdk_Pixbuf;
      er: Glib.Error.GError;
   begin
      Gdk_New_From_File (Buf, path, er);
      Buf := Scale_Simple(Src         => Buf,
                          Dest_Width  => 64,
                          Dest_Height => 64,
                          Inter_Type  => Interp_Bilinear);
      Gtk_New (Img, Buf);
      Fixed.Put(Widget => Img,
                 X      => X,
                 Y      => Y);
   end;
<<<<<<< HEAD:src/blocks.adb
end Blocks;
=======
   procedure Place_Block ( Path: String; X: Gint; Y: Gint; Fixed: Gtk_Layout) is
      Img: Gtk_Image;
      Buf: Gdk_Pixbuf;
      er: Glib.Error.GError;
   begin
      Gdk_New_From_File (Buf, path, er);
      Buf := Scale_Simple(Src         => Buf,
                          Dest_Width  => 64,
                          Dest_Height => 64,
                          Inter_Type  => Interp_Bilinear);
      Gtk_New (Img, Buf);
      Fixed.Put(Child_Widget => Img,
                 X      => X,
                 Y      => Y);
   end;
end Block;
>>>>>>> master:src/block.adb
