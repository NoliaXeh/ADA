
with Gtk.Fixed;       use Gtk.Fixed;
with Gtk.Layout;      use Gtk.Layout;
package Game is

   function Game return Boolean;

   count: Integer := 0;
   Layout : Gtk_Layout;
   Fixed : Gtk_Fixed;

end Game;
