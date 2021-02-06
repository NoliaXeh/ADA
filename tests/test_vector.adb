with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Elementary_Functions;
with Vector; use Vector;

package body test_vector is

   procedure run is

      procedure test_size is

         type Test_Pair is record
            Input : Vector.Vector;
            expected_result : Float;
         end record;

         Test_Value : array (Positive range <>) of Test_Pair :=
           ( ((X => 1.0, Y => 1.0), Ada.Numerics.Elementary_Functions.Sqrt(2.0)),
             ((X => 2.0, Y => 2.0), 2.0 * Ada.Numerics.Elementary_Functions.Sqrt(2.0)),
             ((X => 4.0, Y => 4.0), 4.0 * Ada.Numerics.Elementary_Functions.Sqrt(2.0)),
             ((X => 2.0, Y => 4.0), 2.0 * Ada.Numerics.Elementary_Functions.Sqrt(5.0))
            );

         Result : Float;

      begin
         Put("  test_size... ");
         for Test_Pair of Test_Value loop

            Result := Vector.Size(Test_Pair.Input);

            pragma Assert(Result = Test_Pair.expected_result,
                          "For Input [" & Test_Pair.Input.X'Image & ", " & Test_Pair.Input.Y'Image &
                            "], expected result: " & Test_Pair.expected_result'Image &
                         ", got result: " & Result'Image);

         end loop;
         Put_Line("Done.");

      end test_size;

   begin
      Put_Line("test_vector...");
      test_size;
      Put_Line("test_vector Done.");

   end run;

end test_vector;
