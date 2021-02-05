with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Gtk.Fixed; use Gtk.Fixed;
with Gtk.Image; use Gtk.Image;

with GameObject;

package Block is

   type Block is new GameObject.GameObject with private;
   
   -- Put the block inside the Layer
   --procedure placeBlock (Self : in Block; Layer : in out Gtk_Fixed);
   
   -- getter
   function getNature(Self : in Block) return Integer;
   
   -- setter
   procedure setNature(Self : in out Block; Value : in Integer);
   
private
   type Block is new GameObject.GameObject with record
      
      Nature : Integer := 0; -- Sand, Ground, Water, ...
      
   end record;

end Block;
