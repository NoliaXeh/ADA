with Gtk.Fixed; use Gtk.Fixed;

with GameObject;

package Player
with SPARK_Mode => Off
is

   type Player is new GameObject.GameObject with private;
   
   type Index is range 1..6;
   
   -- getter
   function getMaxHp (Self : in Player) return Float;
   function getHp (Self : in Player) return Float;
   function getSpeed (Self : in Player) return Float;
   function getAnimationSprite(Self : in Player; idx : Index) return Gtk_Fixed;
   
   -- setter
   procedure setMaxHp (Self : in out Player; Value : in Float)
     with Pre => Value > 0.0;
   procedure setHp (Self : in out Player; Value : in Float)
     with Pre => Value >= 0.0 and Value <= Self.getMaxHp;
   procedure setSpeed (Self : in out Player; Value : in Float);
   
private
   --type Index is range 1..6;
   type list is array (Index) of Gtk_Fixed;
      
   function load_sprite (path : String) return Gtk_Fixed;

   type Player is new GameObject.GameObject with record
      MaxHp : Float := 100.0;
      Hp : Float := 100.0;
      Speed : Float := 1.0;
      
      spriteList : list := (
                           load_sprite("Pink/alienPink_stand.png"),
                           load_sprite("Pink/alienPink_stand2.png"),
                           load_sprite("Pink/alienPink_walk1.png"),
                           load_sprite("Pink/alienPink_walk2.png"),
                           load_sprite("Pink/alienPink_walk3.png"),
                           load_sprite("Pink/alienPink_walk4.png"));
   end record;

end Player;
