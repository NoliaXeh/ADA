with Gdk.Pixbuf; use Gdk.Pixbuf;
with Glib.Error; use Glib.Error;
with Gtk.Image; use Gtk.Image;
with Glib; use Glib;
with Block; use Block;
with Anime; use Anime;

with Game; use Game;
with Entity; use Entity;
with Maps; use Maps;
with Vector; use Vector;

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package body Foe 
with SPARK_Mode => Off
is
   
   procedure initSpriteList(Self : in out Foe) is
      procedure fixSprite(Panel : Gtk_Fixed) is
      begin 
         Panel.Put(Self.spriteList(1),0,0);
         Panel.Put(Self.spriteList(2),0,0);
         Panel.Put(Self.spriteList(3),0,0);
         Panel.Put(Self.spriteList(4),0,0);
         Panel.Put(Self.spriteList(5),0,0);
         Panel.Put(Self.spriteList(6),0,0);
      end fixSprite;
   begin
      Gtk_new(Self.panel);
      Self.spriteList := (load_sprite("Blue/alienBlue_stand.png"),
                          load_sprite("Blue/alienBlue_stand2.png"),
                          load_sprite("Blue/alienBlue_walk1.png"),
                          load_sprite("Blue/alienBlue_walk2.png"),
                          load_sprite("Blue/alienBlue_walk3.png"),
                          load_sprite("Blue/alienBlue_walk4.png"));
      fixSprite(Self.Panel);
      Game.Fixed.Put(Self.panel, 0, 0);
   end initSpriteList;
   
   function Foe_New (Position: Vector.Vector) return Foe is
      F : Foe;
   begin
      F.setPosition(Position => Position);
      --F.initSpriteList;
      return F;
   end;
   
   function "=" (F: Foe; G: Foe) return Boolean is
   begin
      return False;
   end;
   

   
   procedure Update (Self: in out Foe) is
      B: Block.Block;
      X: Integer;
      Y: Integer;
   begin
      X := Integer(Self.getEntity.Position.X) / 64;
      Y := Integer(Self.getEntity.Position.Y) / 64;
      if Y+1 >= Game.Map.height or Y-1 < 0 then
         Self.getEntity.Forces.Y := -Self.getEntity.Forces.Y;
         return;
      elsif X+1 >= Game.Map.width or X-1 < 0 then
         Self.getEntity.Forces.X := -Self.getEntity.Forces.X;
         return;
      end if;
      -- Bottom Collision
      B := Maps.Get(X => X,
                 Y => Y + 1);
      if B.getNature /= 2 and then Collides(B.getEntity, Self.getEntity) then
         Entity.Apply_Force(Self.getEntity, (0.0, -Self.getEntity.Forces.Y));
         Self.getEntity.Position.Y := B.getEntity.Position.Y - 62.0;
      end if;
      if Self.State = 0 then
         Self.State := 1;
      elsif Self.State = 1 then -- Right
         Entity.Apply_Force(Self.getEntity, Vector.Mul((800.0, 0.0), Game.Delta_Time));
         B := Maps.Get(X => X,
                       Y => Y);
         if B.getNature /= 2 and then Self.getEntity.Position.X + Self.getEntity.HitBox.Size.X >= (B.getEntity.Position.X) then
            Self.State := 2;
            Self.getEntity.Forces.X := 0.0;
         end if;
      else -- Self.State = 2 -- Left
         Entity.Apply_Force(Self.getEntity, Vector.Mul((-800.0, 0.0), Game.Delta_Time));
         B := Maps.Get(X => X - 1,
                       Y => Y);
         if B.getNature /= 2 and then Self.getEntity.Position.X <= (B.getEntity.Position.X + B.getEntity.HitBox.Size.X) then
            Self.State := 1;
            Self.getEntity.Forces.X := 0.0;
         end if;
      end if;
      if (Anime.isAnimated) then
         if Self.State = 1 then
            Self.setDisplayedSprite(3);
         else
            Self.setDisplayedSprite(5);
         end if;
      else
         if Self.State = 1 then
            Self.setDisplayedSprite(4);
         else
            Self.setDisplayedSprite(6);
         end if;
      end if;
      --- TBR
      Entity.Update (Self.getEntity);
      Game.Fixed.Move(Self.Panel, Gint(Self.getEntity.Position.X - 64.0), Gint(Self.getEntity.Position.Y - 64.0));
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
