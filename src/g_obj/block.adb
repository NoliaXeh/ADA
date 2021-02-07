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
   
   procedure placeBlock (Self : in Block; Layer : in out Gtk_Fixed;
                         X : in Integer; Y : in Integer) is
      Buff : Gdk_Pixbuf;
      Img : Gtk_Image;
      err : GError;
   begin
      -- Load image
      Gdk_New_From_File(Pixbuf   => Buff,
                        Filename => Self.getSpritePath,
                        Error    => err);
      -- resize
      Buff := Scale_Simple(Src         => Buff,
                          Dest_Width  => Gint(X),
                          Dest_Height => Gint(Y),
                          Inter_Type  => Interp_Bilinear);
      -- Create widget
      Gtk_New(Img, Buff);
      -- Put the new widget inside the Layer
      Layer.Put(Widget => Img,
                X      => Gint(Self.getEntity.Position.X-64.0),
                Y      => Gint(Self.getEntity.Position.Y-64.0));
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
