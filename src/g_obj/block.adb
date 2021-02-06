with Gdk.Pixbuf; use Gdk.Pixbuf;
with Glib.Error; use Glib.Error;
with Glib; use Glib;

package body Block
with SPARK_Mode => Off -- GTK
is
   
   procedure placeBlock (Self : in Block; Layer : in out Gtk_Fixed) is
      Buff : Gdk_Pixbuf;
      Img : Gtk_Image;
      err : GError;
   begin
      -- Load image
      Gdk_New_From_File(Pixbuf   => Buff,
                        Filename => Self.getSpritePath,
                        Error    => err);
      -- Create widget
      Gtk_New(Img, Buff);
      -- Put the new widget inside the Layer
      Layer.Put(Widget => Img,
                X      => Gint(Self.getEntity.Position.X),
                Y      => Gint(Self.getEntity.Position.Y));
   end placeBlock;

   -- getter
   function getNature (Self : in Block) return Integer is (Self.Nature);
   function getFriction (Self : in Block) return Float is (Self.Friction);
   
   -- setter
   procedure setNature (Self : in out Block; Value : in Integer) is
   begin
      Self.Nature := Value;
   end setNature;
   
   
   procedure setFriction (Self : in out Block; Value : in Float) is
   begin
      Self.Friction := Value;
   end setFriction;
   
   -- private

end Block;
