with Ada.Containers.Hashed_Maps;  use Ada.Containers;
with Ada.Containers.Indefinite_Hashed_Maps;
with Gtk.Fixed;       use Gtk.Fixed;
with Ada.Containers;
with Block; use Block;
--with Game; use Game;


package Maps
with SPARK_Mode => Off
is
   function IntegerHash(i: Integer) return Ada.Containers.Hash_Type;
   package hashMap is new Indefinite_Hashed_Maps (Key_Type => Integer,
                                               Element_Type => Block.Block,
                                               Hash => IntegerHash,
                                           Equivalent_Keys => "=");
   type Map is record
      height:Integer;
      width:Integer;
      map:hashMap.Map;
   end record;

   function Get(X : integer; Y : integer) return Block.Block
     with
       --Pre => X>=0 and X<Game.Map.width and Y>=0 and Y<Game.Map.height,
     Post => Get'Result.Getname /= "";

   procedure print(map: in Maps.Map)
     with
       Pre => map.height /= 0 and map.width /= 0;

   procedure fill_screen(map: in Maps.Map)
     with
       Pre => map.height /= 0 and map.width /= 0;

end Maps;
