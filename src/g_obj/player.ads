with Gtk.Fixed; use Gtk.Fixed;

with GameObject;

package Player
with SPARK_Mode => Off
is

   type Player is new GameObject.GameObject with private;
   
   type Index is range 1..6;
   
   procedure initSpriteList(Self : in out Player);
   procedure fixSprite(Self : in out Player; Panel : Gtk_Fixed);
   
   -- getter
   function getMaxHp (Self : in Player) return Float;
   function getHp (Self : in Player) return Float;
   function getSpeed (Self : in Player) return Float;
   
   -- setter
   procedure setMaxHp (Self : in out Player; Value : in Float)
     with Pre => Value > 0.0;
   procedure setHp (Self : in out Player; Value : in Float)
     with Pre => Value >= 0.0 and Value <= Self.getMaxHp;
   procedure setSpeed (Self : in out Player; Value : in Float);
   
   -- Disable all sprites and enable the one at index idx
   procedure setDisplayedSprite(Self: in Player; idx : Index);
   
private
   type list is array (Index) of Gtk_Fixed;
      
   function load_sprite (path : String) return Gtk_Fixed;

   type Player is new GameObject.GameObject with record
      MaxHp : Float := 100.0;
      Hp : Float := 100.0;
      Speed : Float := 1.0;
      
      spriteList : list;
   end record;

end Player;
