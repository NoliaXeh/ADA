with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package body GameObject is
   
   -- getter
   function getId (Self : in GameObject) return Integer is (Self.Id);
   function getSpriteId (Self : in GameObject) return Integer is (Self.SpriteId);
   function getMesh (Self : in GameObject) return Entity.Entity is (Self.Mesh);
   
   -- setter
   procedure setSpriteId (Self : in out GameObject; Value : in Integer) is
   begin
      Self.SpriteId := Value;
   end setSpriteId;
   
   procedure setMesh (Self : in out GameObject; Value : in Entity.Entity) is
   begin
      Self.Mesh := Value;
   end setMesh;
   
   -- private
   function init_id return Integer is
      Id : Integer := Counter;
   begin
      Counter := Counter + 1;
      return Id;
   end init_id;

end GameObject;
