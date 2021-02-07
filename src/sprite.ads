with Gtk.Image;       use Gtk.Image;
with Gdk.Pixbuf;      use Gdk.Pixbuf;
with Gtk.Fixed;       use Gtk.Fixed;
with Gtk.Window;      use Gtk.Window;
with Glib;            use Glib;
with Glib.Error;      use Glib.Error;
with Gtk.Layout;      use Gtk.Layout;
with Vector;          use Vector;

package Sprite
with SPARK_Mode => Off --GTK
is

   type Sprite is record
      Panel   : Gtk_Fixed;
      Img : Gtk_Fixed;
      Visible : Boolean;
      Position: Vector.Vector;
   end record;
   
   function Sprite_New (Path: String; Panel: Gtk_Fixed; Size_X : Gint; Size_Y: Gint) return Sprite
     with
       Pre => Size_X > 0 and Size_Y > 0 and Panel /= null;
   
   procedure Set_Visibility (Sp : in out Sprite; Visible: in Boolean);
   
   procedure Move (Sp: in out Sprite; Position: Vector.Vector);

end Sprite;
