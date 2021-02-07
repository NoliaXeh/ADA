with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Gtk.Fixed; use Gtk.Fixed;
with Gtk.Image; use Gtk.Image;

with GameObject;

package Block
with SPARK_Mode => Off -- GTK
is

   type Block is new GameObject.GameObject with private;
   
   -- Put the block inside the Layer
   procedure placeBlock (Self : in Block; Layer : in out Gtk_Fixed);
   procedure placeBlock (Self : in Block; Layer : in out Gtk_Fixed;
                         X : in Integer; Y : in Integer);
   
   -- getter
   function getNature(Self : in Block) return Integer;
   function getFriction (Self : in Block) return Float;
   
   -- setter
   procedure setNature(Self : in out Block; Value : in Integer);
   procedure setFriction (Self : in out Block; Value : in Float)
     with Pre => Value >= 0.0;
   
private
   type Block is new GameObject.GameObject with record
      
      Nature : Integer := 0; -- Sand, Ground, Water, ...
      Friction : Float := 0.5;
      
   end record;

end Block;
