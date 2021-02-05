package body Player 
with SPARK_Mode => On
is

   -- getter
   function getMaxHp (Self : in Player) return Float is (Self.MaxHp);
   function getHp (Self : in Player) return Float is (Self.Hp);
   function getSpeed (Self : in Player) return Float is (Self.Speed);
   
   -- setter
   procedure setMaxHp (Self : in out Player; Value : in Float) is
   begin
      Self.MaxHp := Value;
   end setMaxHp;
   
   procedure setHp (Self : in out Player; Value : in Float) is
   begin
      Self.Hp := Value;
   end setHp;
   
   procedure setSpeed (Self : in out Player; Value : in Float) is
   begin
      Self.Speed := Value;
   end setSpeed;
   
   -- private

end Player;
