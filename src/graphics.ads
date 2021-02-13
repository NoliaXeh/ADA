with Maps; use Maps;
with Gtk.Fixed;       use Gtk.Fixed;
with Ada.Text_IO; use Ada.Text_IO;
with file; use file;
package Graphics
with SPARK_Mode => Off -- GTK
is
   procedure fill_screen(map: in Maps.Map)
      with
         Pre => map.height /= 0 and map.width /= 0;
   procedure set_image(panel : Gtk_Fixed; image: in String)
     with
       Pre => File.File_Exist(image);
   procedure init(map : Maps.Map);


end Graphics;
