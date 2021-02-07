with Gdk.Pixbuf; use Gdk.Pixbuf;
with Glib.Error; use Glib.Error;
with Gtk.Image; use Gtk.Image;
with Glib; use Glib;
with Block; use Block;

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
   begin
      Self.spriteList := (load_sprite("Blue/alienBlue_stand.png"),
                          load_sprite("Blue/alienBlue_stand.png"),
                          load_sprite("Blue/alienBlue_walk1.png"),
                          load_sprite("Blue/alienBlue_walk2.png"),
                          load_sprite("Blue/alienBlue_walk1.png"),
                          load_sprite("Blue/alienBlue_walk2.png"));
      Game.Fixed.Put(Self.spriteList(1), 0, 0);
   end initSpriteList;
   
   procedure Update (Self: in out Foe) is
      B: Block.Block;
      Tmp_Entity : Entity.Entity;
      X: Integer;
      Y: Integer;
   begin
      Tmp_Entity := Self.getEntity;
      Tmp_Entity.Mass := 100.0;
      X := Integer(Tmp_Entity.Position.X) / 64;
      Y := Integer(Tmp_Entity.Position.Y) / 64;
      if Y+1 >= Game.Map.height or Y-1 < 0 then
         Tmp_Entity.Forces.Y := -Tmp_Entity.Forces.Y;
         return;
      elsif X+1 >= Game.Map.width or X-1 < 0 then
         Tmp_Entity.Forces.X := -Tmp_Entity.Forces.X;
         return;
      end if;
      -- Bottom Collision
      B := Maps.Get(X => X,
                 Y => Y + 1);
      if B.getNature /= 2 and then Collides(B.getEntity, Tmp_Entity) then
         Entity.Apply_Force(Tmp_Entity, (0.0, -Tmp_Entity.Forces.Y));
         Tmp_Entity.Position.Y := B.getEntity.Position.Y - 62.0;
      end if;
      if Self.State = 0 then
         Self.State := 1;
      elsif Self.State = 1 then -- Right
         Entity.Apply_Force(Tmp_Entity, Vector.Mul((800.0, 0.0), Game.Delta_Time));
         B := Maps.Get(X => X,
                       Y => Y);
         if B.getNature /= 2 and then Tmp_Entity.Position.X + Tmp_Entity.HitBox.Size.X >= (B.getEntity.Position.X) then
            Self.State := 2;
            Tmp_Entity.Forces.X := 0.0;
         end if;
      else -- Self.State = 2 -- Left
         Entity.Apply_Force(Tmp_Entity, Vector.Mul((-800.0, 0.0), Game.Delta_Time));
         B := Maps.Get(X => X - 1,
                       Y => Y);
         if B.getNature /= 2 and then Tmp_Entity.Position.X <= (B.getEntity.Position.X + B.getEntity.HitBox.Size.X) then
            Self.State := 1;
            Tmp_Entity.Forces.X := 0.0;
         end if;
      end if;
      --- TBR
      Entity.Update (Tmp_Entity);
      Self.setEntity(Tmp_Entity);
      Game.Fixed.Move(Self.spriteList(1), Gint(Tmp_Entity.Position.X - 64.0), Gint(Tmp_Entity.Position.Y - 64.0));
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
      Put ("1");
      -- Load image
      Gdk_New_From_File(Pixbuf   => Buff,
                        Filename => path,
                        Error    => err);
      Put ("2");
      -- resize
      Buff := Scale_Simple(Src         => Buff,
                          Dest_Width  => 64,
                          Dest_Height => 128,
                          Inter_Type  => Interp_Bilinear);
      Put ("3");
      -- Create widget
      Gtk_New(Img, Buff);
      Put ("4");
      
      -- Create widget
      Gtk_New(Fixed);
      Put ("5");
      
      -- Put the new widget inside the Layer
      Fixed.Put(Widget => Img, X => 0, Y => 0);
      Put ("6");

      return Fixed;
   end load_sprite;
   
end Foe;
