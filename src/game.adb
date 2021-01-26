with Text_IO; use Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
package body Game is
   function Game return Boolean is
   begin
      ---
      count := count + 1;
      Ada.Integer_Text_IO.Put (count);
      Put_Line("");
      ---
      return True;
   end;
end Game;
