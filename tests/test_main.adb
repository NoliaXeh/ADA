with Ada.Text_IO; use Ada.Text_IO;
with test_vector; use test_vector;


procedure test_main is


begin
   Put_Line("TESTSUITE");
   test_vector.run;
   Put_Line("DONE.");
end test_main;
