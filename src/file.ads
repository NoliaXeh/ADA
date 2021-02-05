with Maps;  use Maps;
package file is
   procedure Read_File(Output: out Maps.Map)
     with
       Post => Output.height /= 0 and Output.width /= 0;



end file;
