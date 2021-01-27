with Text_IO; use Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Glib;            use Glib;

package body Game is
   function Game return Boolean is
   begin
      ---
      count := count + 1;
      Ada.Integer_Text_IO.Put (count);
      Put_Line("");
      Layout.Move (Fixed, -Gint(count), 0);
      ---
      return True;
   end;
end Game;
