with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO;           use Ada.Integer_Text_IO;

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
         begin
            for j in 1..Output.width loop
               Output.Map.Include (i, Line(j));
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
