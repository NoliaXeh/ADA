with Maps; use Maps;
with Gtk.Fixed;       use Gtk.Fixed;
package Graphics
with SPARK_Mode => Off -- GTK
is

   procedure fill_screen(map: in Maps.Map);
   procedure set_background(image: in String);

end Graphics;
