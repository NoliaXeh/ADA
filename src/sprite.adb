with Gtk.Image;       use Gtk.Image;
with Gdk.Pixbuf;      use Gdk.Pixbuf;
with Gtk.Fixed;       use Gtk.Fixed;
with Gtk.Window;      use Gtk.Window;
with Glib;            use Glib;
with Glib.Error;      use Glib.Error;
with Gtk.Layout;      use Gtk.Layout;


with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

package body Sprite
with SPARK_Mode => Off -- GTK
is

   function Sprite_New (Path: String; Panel: Gtk_Fixed; Size_X : Gint; Size_Y: Gint) return Sprite is
      Img: Gtk_Image;
      Buf: Gdk_Pixbuf;
      er: Glib.Error.GError;
      Ret: Sprite;
   begin
      Gdk_New_From_File (Buf, Path, er);
      Buf := Scale_Simple(Src         => Buf,
                          Dest_Width  => Size_X,
                          Dest_Height => Size_Y,
                          Inter_Type  => Interp_Bilinear);
      Gtk_New (Img, Buf);
      Panel.Put(Img, 64, 64);
      Ret.Image   := Img;
      Ret.Panel   := Panel;
      Ret.Visible := False;
      Ret.Position:= (64.0, 64.0);
      return Ret;
   end Sprite_New;

      
   procedure Set_Visibility (Sp : in out Sprite; Visible: in Boolean) is
   begin
      Sp.Visible := Visible;
      if Visible then
         Sp.Panel.Move (Sp.Image, Gint(Sp.Position.X), Gint(Sp.Position.Y));
      else
         Sp.Panel.Move (Sp.Image, Gint(-0.0), Gint(-0.0));
      end if;
      
   end;
   
   
   procedure Move (Sp: in out Sprite; Position: Vector.Vector) is
   begin
      Sp.Position.X := Position.X;
      Sp.Position.Y := Position.Y;
      
      if Sp.Visible then
         Sp.Position.X := Sp.Position.X + 100.0;
         Ada.Float_Text_IO.Put(Sp.Position.X);
         Ada.Text_IO.Put_Line("");
        
         --Sp.Panel.Move (Sp.Image, Gint(Sp.Position.X), Gint(Sp.Position.Y));
         Sp.Panel.Move (Sp.Image, 10, 10);
         Sp.Panel.Get_Parent.Show_Now;
      end if;
   end;
   
end Sprite;
