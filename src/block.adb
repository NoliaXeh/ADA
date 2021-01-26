with Gtk.Image;       use Gtk.Image;
with Gtk.Fixed;       use Gtk.Fixed;
with Gtk.Window;      use Gtk.Window;
with Glib;            use Glib;
with Gtk.Layout;      use Gtk.Layout;

package body Block is
   procedure Place_Block ( Path: String; X: Gint; Y: Gint; Fixed: Gtk_Fixed) is
      Img: Gtk_Image;
   begin
      Gtk_New (Img, path);
      Fixed.Put(Widget => Img,
                 X      => X,
                 Y      => Y);
   end;
end Block;
