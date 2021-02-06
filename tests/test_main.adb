with Ada.Text_IO; use Ada.Text_IO;
with test_vector; use test_vector;
with test_sprite; use test_sprite;
with test_maps; use test_maps;


procedure test_main is


begin
   Put_Line("TESTSUITE");
   test_vector.run;
   test_sprite.run;
   test_maps.run;
   Put_Line("DONE.");
end test_main;
