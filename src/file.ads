with Maps;  use Maps;
package file is
   function File_Exist (Name : String) return Boolean
     with Pre => Name /= "";

   procedure Read_File(Path: String; Output: out Maps.Map)
     with
       Pre => File_Exist(Path),
       Post => Output.height /= 0 and Output.width /= 0;



end file;
