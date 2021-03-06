with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO;           use Ada.Integer_Text_IO;
with Block;
with Game; use Game;
with Foe; use Foe;

with Maps;  use Maps;
package body file is
   
   function File_Exist (Name : String) return Boolean is
      File : Ada.Text_IO.File_Type;
   begin
      Open (File, In_File, Name);
      Close (File);
      return True;
   exception
      when Name_Error =>
         return False;
   end File_Exist;

   procedure Read_File(Path:String; Output: out Maps.Map) is
      Input : File_Type;
      i : Integer;
   begin
      Open (File => Input,
            Mode => In_File,
            Name => Path);
      i := 0;
      Output.height := Integer'Value (Get_Line (Input));
      Output.width := Integer'Value (Get_Line (Input));
      loop
         declare
            Line : String := Get_Line (Input);
            Blk_tmp : Block.Block;
         begin
            for j in 1..Output.width loop
               if Line(j) = 'S' then
                  Blk_tmp.setSpritePath(Value => "sand.png");
                  Blk_tmp.setName(Value => "Sand");
                  Blk_tmp.setNature(Value => 0);
               elsif Line(j) = 'W' then 
                  Blk_tmp.setSpritePath(Value => "water.png");
                  Blk_tmp.setName(Value => "Water");
                  Blk_tmp.setNature(Value => 1);
               elsif Line(j) = 'C' then 
                  Blk_tmp.setSpritePath(Value => "stone.png");
                  Blk_tmp.setName(Value => "Cobble");
                  Blk_tmp.setNature(Value => 0);
               elsif Line(j) = 'T' then 
                  Blk_tmp.setSpritePath(Value => "dirt.png");
                  Blk_tmp.setName(Value => "Dirt");
                  Blk_tmp.setNature(Value => 0);
               elsif Line(j) = 'G' then 
                  Blk_tmp.setSpritePath(Value => "grass.png");
                  Blk_tmp.setName(Value => "Grass");
                  Blk_tmp.setNature(Value => 0);
               elsif Line(j) = 'P' then 
                  Game.plum.getEntity.Position.X := Float(j);
                  Game.plum.getEntity.Position.Y := Float(i - j) / Float(Output.width);
                  Blk_tmp.setSpritePath(Value => "yapas.png");
                  Blk_tmp.setName(Value => "Air");
                  Blk_tmp.setNature(Value => 2);
               elsif Line(j) = 'F' then 
                  Blk_tmp.setSpritePath(Value => "Fusee.png");
                  Blk_tmp.setName(Value => "Fusee");
                  Blk_tmp.setNature(Value => 4);
               elsif Line(j) = 'E' then 
                  Blk_tmp.setSpritePath(Value => "yapas.png");
                  Blk_tmp.setName(Value => "exit");
                  Blk_tmp.setNature(Value => 4);
               elsif Line(j) = 'M' then
                  Game.Foe_List.Append (Foe_New ((64.0 * Float(j), 
                                        Float(i + 1 - j)/ Float(Output.width) * 64.0)));
                  Blk_tmp.setSpritePath(Value => "yapas.png");
                  Blk_tmp.setName(Value => "Air");
                  Blk_tmp.setNature(Value => 2);
               else
                  Blk_tmp.setSpritePath(Value => "yapas.png");
                  Blk_tmp.setName(Value => "Air");
                  Blk_tmp.setNature(Value => 2);
               end if;
               Blk_tmp.setPosition((X => Float(j) * 64.0,
                                    Y => Float(i - j) / Float(Output.width) * 64.0));

               Output.Map.Include (i, Blk_tmp);
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
