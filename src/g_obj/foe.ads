with Gtk.Fixed; use Gtk.Fixed;

with GameObject;

package Foe
with SPARK_Mode => Off
is

   type Foe is new GameObject.GameObject with private;
   
   type Index is range 1..6;
   
   procedure initSpriteList(Self : in out Foe);
   
   -- IA
   procedure Update (Self: in out Foe);
   
   -- getter
   function getMaxHp (Self : in Foe) return Float;
   function getHp (Self : in Foe) return Float;
   function getSpeed (Self : in Foe) return Float;
   
   -- setter
   procedure setMaxHp (Self : in out Foe; Value : in Float)
     with Pre => Value > 0.0;
   procedure setHp (Self : in out Foe; Value : in Float)
     with Pre => Value >= 0.0 and Value <= Self.getMaxHp;
   procedure setSpeed (Self : in out Foe; Value : in Float);
   
   -- Disable all sprites and enable the one at index idx
   procedure setDisplayedSprite(Self: in Foe; idx : Index);
   
private
   type list is array (Index) of Gtk_Fixed;
      
   function load_sprite (path : String) return Gtk_Fixed;

   type Foe is new GameObject.GameObject with record
      MaxHp : Float := 100.0;
      Hp : Float := 100.0;
      Speed : Float := 1.0;
      
      spriteList : list;
   end record;

end Foe;
