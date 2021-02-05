with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO;           use Ada.Integer_Text_IO;
with Block;

with Maps;  use Maps;
package body file is

   procedure Read_File(Output: out Maps.Map) is
      Input : File_Type;
      i : Integer;
   begin
      Open (File => Input,
            Mode => In_File,
            Name => "src/map.txt");
      i := 0;
      Output.height := Integer'Value (Get_Line (Input));
      Output.width := Integer'Value (Get_Line (Input));
      loop
         declare
            Line : String := Get_Line (Input);
            TAMAMAN : Block.Block;
         begin
            for j in 1..Output.width loop
               if Line(j) = 'S' then
                  TAMAMAN.setSpritePath(Value => "sand.png");
                  TAMAMAN.setName(Value => "Sand");
                  TAMAMAN.setNature(Value => 0);
               elsif Line(j) = 'W' then 
                  TAMAMAN.setSpritePath(Value => "water.png");
                  TAMAMAN.setName(Value => "Water");
                  TAMAMAN.setNature(Value => 1);
               elsif Line(j) = 'C' then 
                  TAMAMAN.setSpritePath(Value => "stone.png");
                  TAMAMAN.setName(Value => "Cobble");
                  TAMAMAN.setNature(Value => 0);
               elsif Line(j) = 'T' then 
                  TAMAMAN.setSpritePath(Value => "dirt.png");
                  TAMAMAN.setName(Value => "Dirt");
                  TAMAMAN.setNature(Value => 0);
               elsif Line(j) = 'G' then 
                  TAMAMAN.setSpritePath(Value => "grass.png");
                  TAMAMAN.setName(Value => "Grass");
                  TAMAMAN.setNature(Value => 0);
               else
                  TAMAMAN.setSpritePath(Value => "yapas.png");
                  TAMAMAN.setName(Value => "Air");
                  TAMAMAN.setNature(Value => 2);
               end if;
               

               Output.Map.Include (i, TAMAMAN);
               i := i + 1;
            end loop;
         end;
      end loop;
   exception
      when End_Error =>
         if Is_Open(Input) then 
            Close (Input);
         end if;
   end Read_File;
   
end file;
