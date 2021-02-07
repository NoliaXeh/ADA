with Gdk.Pixbuf; use Gdk.Pixbuf;
with Glib.Error; use Glib.Error;
with Gtk.Image; use Gtk.Image;
with Glib; use Glib;

package body Foe 
with SPARK_Mode => Off
is
   procedure initSpriteList(Self : in out Foe) is
   begin
      Self.spriteList := (load_sprite("Blue/alienBlue_stand.png"),
                          load_sprite("Blue/alienBlue_stand2.png"),
                          load_sprite("Blue/alienBlue_walk1.png"),
                          load_sprite("Blue/alienBlue_walk2.png"),
                          load_sprite("Blue/alienBlue_walk3.png"),
                          load_sprite("Blue/alienBlue_walk4.png"));
   end initSpriteList;
   
   procedure Update (Self: in out Foe) is
   begin
      null;
   end Update;

   -- getter
   function getMaxHp (Self : in Foe) return Float is (Self.MaxHp);
   function getHp (Self : in Foe) return Float is (Self.Hp);
   function getSpeed (Self : in Foe) return Float is (Self.Speed);
   function getAnimationSprite(Self : in Foe; idx : Index) return Gtk_Fixed is
     (Self.spriteList(idx));
   
   -- setter
   procedure setMaxHp (Self : in out Foe; Value : in Float) is
   begin
      Self.MaxHp := Value;
   end setMaxHp;
   
   procedure setHp (Self : in out Foe; Value : in Float) is
   begin
      Self.Hp := Value;
   end setHp;
   
   procedure setSpeed (Self : in out Foe; Value : in Float) is
   begin
      Self.Speed := Value;
   end setSpeed;
   
   procedure setDisplayedSprite(Self: in Foe; idx : Index) is
   begin
      for I in Index loop
         Self.spriteList(I).Set_Visible(I = idx);
      end loop;
   end setDisplayedSprite;
   
   -- private
   function load_sprite (path : String) return Gtk_Fixed is
      Buff : Gdk_Pixbuf;
      err : GError;
      Img : Gtk_Image;
      fixed : Gtk_Fixed;
   begin
      -- Load image
      Gdk_New_From_File(Pixbuf   => Buff,
                        Filename => path,
                        Error    => err);
      -- resize
      Buff := Scale_Simple(Src         => Buff,
                          Dest_Width  => 64,
                          Dest_Height => 128,
                          Inter_Type  => Interp_Bilinear);
      -- Create widget
      Gtk_New(Img, Buff);
      
      -- Create widget
      Gtk_New(Fixed);
      
      -- Put the new widget inside the Layer
      Fixed.Put(Widget => Img, X => 0, Y => 0);

      return Fixed;
   end load_sprite;
   
end Foe;
