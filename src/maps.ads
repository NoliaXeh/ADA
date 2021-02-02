with Ada.Containers.Hashed_Maps;  use Ada.Containers;
with Ada.Containers.Indefinite_Hashed_Maps;
with Gtk.Fixed;       use Gtk.Fixed;
with Ada.Containers;

package Maps is
   function IntegerHash(i: Integer) return Ada.Containers.Hash_Type;
   package hashMap is new Indefinite_Hashed_Maps (Key_Type => Integer,
                                               Element_Type => Character,
                                               Hash => IntegerHash,
                                           Equivalent_Keys => "=");
   type Map is record
      height:Integer;
      width:Integer;
      map:hashMap.Map;
   end record;
   procedure print(map: in Maps.Map);
   procedure fill_screen(map: in Maps.Map);
end Maps;
