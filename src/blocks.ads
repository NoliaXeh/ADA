with Gtk.Image;       use Gtk.Image;
with Gtk.Fixed;       use Gtk.Fixed;
with Gtk.Window;      use Gtk.Window;
with Glib;            use Glib;
with Gtk.Layout;      use Gtk.Layout;

package Blocks is

   procedure Place_Block ( Path: String; X: Gint; Y: Gint; Fixed: Gtk_Fixed);
end Blocks;
