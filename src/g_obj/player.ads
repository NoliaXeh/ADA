with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with GameObject;

package Player is

   type Player is new GameObject.GameObject with private;
   
   -- getter
   function getName (Self : in Player) return String;
   function getMaxHp (Self : in Player) return Float;
   function getHp (Self : in Player) return Float;
   function getSpeed (Self : in Player) return Float;
   
   -- setter
   procedure setName (Self : in out Player; Value : in String)
     with Pre => Value'Length > 0;
   procedure setMaxHp (Self : in out Player; Value : in Float)
     with Pre => Value > 0.0;
   procedure setHp (Self : in out Player; Value : in Float)
     with Pre => Value >= 0.0 and Value <= Self.getMaxHp;
   procedure setSpeed (Self : in out Player; Value : in Float);
   
private
   type Player is new GameObject.GameObject with record
      Name : Unbounded_String := To_Unbounded_String("Plum");
      MaxHp : Float := 100.0;
      Hp : Float := 100.0;
      Speed : Float := 1.0;
   end record;

end Player;
