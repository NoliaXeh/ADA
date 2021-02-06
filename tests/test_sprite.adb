with Ada.Text_IO; use Ada.Text_IO;
with Sprite; use Sprite;
with Vector; use Vector;

package body test_sprite is
   
   procedure run is

      procedure test_move is

         type Test_Pair is record
            Input_sprite : Sprite.Sprite;
            Input_vector : Vector.Vector;
            expected_result : Sprite.Sprite;
         end record;

         Test_Value : array (Positive range <>) of Test_Pair :=
           ( ((null, null, False, (2.0, 2.0)), (2.0, 2.0), (null, null, False, (2.0, 2.0))),
             ((null, null, False, (2.0, 2.0)), (2.0, 4.0), (null, null, False, (2.0, 4.0))),
             ((null, null, True, (2.0, 2.0)), (2.0, 2.0), (null, null, False, (102.0, 2.0))),
             ((null, null, True, (2.0, 2.0)), (2.0, 4.0), (null, null, False, (102.0, 4.0)))
            );

         old : Vector.Vector;
         
      begin
         Put("  test_move... ");
         for Test_Pair of Test_Value loop

            old := Test_Pair.Input_sprite.Position;
            
            Sprite.Move(Test_Pair.Input_sprite, Test_Pair.Input_vector);

            pragma Assert(Test_Pair.Input_sprite.Position.X = Test_Pair.expected_result.Position.X and 
                          Test_Pair.Input_sprite.Position.Y = Test_Pair.expected_result.Position.Y,
                          "For Input [" & old.X'Image & ", " & old.Y'Image &
                            "], expected result: [" & Test_Pair.expected_result.Position.X'Image & ", " & Test_Pair.expected_result.Position.Y'Image &
                         "], got result: [" & Test_Pair.Input_sprite.Position.X'Image & ", " & Test_Pair.Input_sprite.Position.Y'Image & "]");

         end loop;
         Put_Line("Done.");

      end test_move;

      procedure test_set_visibility is

         type Test_Pair is record
            Input_sprite : Sprite.Sprite;
            Visible : Boolean;
            expected_result : Sprite.Sprite;
         end record;

         Test_Value : array (Positive range <>) of Test_Pair :=
           ( ((null, null, False, (2.0, 2.0)), False, (null, null, False, (2.0, 2.0))),
             ((null, null, False, (2.0, 2.0)), True, (null, null, True, (2.0, 2.0))),
             ((null, null, True, (2.0, 2.0)), False, (null, null, False, (2.0, 2.0))),
             ((null, null, True, (2.0, 2.0)), True, (null, null, True, (2.0, 2.0)))
            );

         old : Vector.Vector;
         
      begin
         Put("  test_set_visibility... ");
         for Test_Pair of Test_Value loop

            old := Test_Pair.Input_sprite.Position;
            
            Sprite.Set_Visibility(Test_Pair.Input_sprite, Test_Pair.Visible);

            pragma Assert(Test_Pair.Input_sprite.Position.X = Test_Pair.expected_result.Position.X and 
                            Test_Pair.Input_sprite.Position.Y = Test_Pair.expected_result.Position.Y and
                              Test_Pair.Input_sprite.Visible = Test_Pair.expected_result.Visible,
                          "For Input [" & old.X'Image & ", " & old.Y'Image &
                            "], expected result: [" & Test_Pair.expected_result.Position.X'Image & ", " & Test_Pair.expected_result.Position.Y'Image &
                            "], got result: [" & Test_Pair.Input_sprite.Position.X'Image & ", " & Test_Pair.Input_sprite.Position.Y'Image & "]");
            

         end loop;
         Put_Line("Done.");

      end test_set_visibility;

   begin
      Put_Line("test_sprite...");
      test_move;
      test_set_visibility;
      Put_Line("test_sprite Done.");

   end run;
   

end test_sprite;
