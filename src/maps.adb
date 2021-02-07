with Ada.Containers.Hashed_Maps;  use Ada.Containers;
with Ada.Text_IO; use Ada.Text_IO;
with Gtk.Fixed;       use Gtk.Fixed;
with Blocks; use Blocks;
with Glib;            use Glib;
with Game; use Game;
package body Maps
with SPARK_Mode => Off
is

   function IntegerHash(i: Integer) return Ada.Containers.Hash_Type is
   begin
        return Hash_Type'Val (i);
   end IntegerHash;
   
   procedure print(map: in Maps.Map) is
   begin
      for i in 0..map.height-1 loop
         for j in 0..map.width-1 loop
            Put(map.map.Element(i*map.width+j).getName(1));
         end loop;
         Put_Line("");
      end loop;
   end print;
   
   procedure fill_screen(map: in Maps.Map) is
   begin
      for i in 0..map.height-1 loop
         for j in 0..map.width-1 loop
            if map.map.Element(i*map.width+j).getName = "Grass" then
                  Blocks.Place_Block(Path  => "grass.png",
                              X     => Gint(j * 64),
                              Y     => Gint(i * 64),
                                      Fixed => Game.Fixed_Mid);
            elsif map.map.Element(i*map.width+j).getName = "Sand" then
                  Blocks.Place_Block(Path  => "sand.png",
                              X     => Gint(j * 64),
                              Y     => Gint(i * 64),
                                    Fixed => Game.Fixed_Mid);
            elsif map.map.Element(i*map.width+j).getName = "Dirt" then
                  Blocks.Place_Block(Path  => "dirt.png",
                              X     => Gint(j * 64),
                              Y     => Gint(i * 64),
                                    Fixed => Game.Fixed_Mid);
            elsif map.map.Element(i*map.width+j).getName = "Water" then
                  Blocks.Place_Block(Path  => "water.png",
                              X     => Gint(j * 64),
                              Y     => Gint(i * 64),
                                    Fixed => Game.Fixed_Front);
            elsif map.map.Element(i*map.width+j).getName = "Cobble" then
                  Blocks.Place_Block(Path  => "stone.png",
                              X     => Gint(j * 64),
                              Y     => Gint(i * 64),
                                     Fixed => Game.Fixed_Mid);
            elsif map.map.Element(i*map.width+j).getName = "Fusee" then
               map.map.Element(i*map.width+j).placeBlock(Layer => Game.Fixed_Front,
                                                         X     => 64,
                                                         Y     => 128);
            end if;
         end loop;
      end loop;
   end fill_screen;
   
   function Get(X : integer; Y : integer) return Block.Block is
   begin
      return Game.Map.map.Element(Y*Game.Map.width+X);
   end Get;
   
end Maps;
