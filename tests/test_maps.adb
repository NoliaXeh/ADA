with Ada.Text_IO; use Ada.Text_IO;
with Maps; use Maps;
with Block; use Block;
with Game; use Game;

package body test_maps is

   procedure run is
      
      procedure test_get is

         type Test_Pair is record
            Input_X : Integer;
            Input_Y : Integer;
            expected_result : Integer;
         end record;
         
         b : Block.Block;

         Test_Value : array (Positive range <>) of Test_Pair :=
           ( (0, 0, 0),
             (0, 1, 1)
            );
         
         Result : Block.Block;

      begin
         Put("  test_get... ");
         for Test_Pair of Test_Value loop
            
            setNature(b, Test_Pair.expected_Result);
            game.map.map.Include(0, b);

            Result := Maps.Get(Test_Pair.Input_X, Test_Pair.Input_Y);

            pragma Assert(getNature(Result) = Test_Pair.expected_result,
                          "For Input [" & Test_Pair.Input_X'Image & ", " & Test_Pair.Input_Y'Image &
                            "], expected result: " & Test_Pair.expected_result'Image &
                            ", got result: " & getNature(Result)'Image);

         end loop;
         Put_Line("Done.");

      end test_get;
      
   begin
      Put_Line("test_maps...");
      test_get;
      Put_Line("test_maps Done.");
   end run;
   

end test_maps;
