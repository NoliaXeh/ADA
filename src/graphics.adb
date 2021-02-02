with Maps; use Maps;
with Gtk.Fixed;       use Gtk.Fixed;
with Gtk.Image;       use Gtk.Image;
with Game; use Game;
package body Graphics is

   procedure fill_screen(map: in Maps.Map) is
   begin
      Maps.fill_screen(map);
   end fill_screen;
   procedure set_background(image: in String) is 
      img : Gtk_Image;
   begin
      Gtk_New (img, image);
      Game.Fixed_Back.Put(Widget => img,
                 X      => 0,
                 Y      => 0);
   end set_background;

end Graphics;
