with GameObject;

package Player is

   type Player is new GameObject.GameObject with private;
   
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
   
private
   type Player is new GameObject.GameObject with record
      MaxHp : Float := 100.0;
      Hp : Float := 100.0;
      Speed : Float := 1.0;
   end record;

end Player;
