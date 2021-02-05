with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package body GameObject is
   
   -- getter
   function getId (Self : in GameObject) return Integer is (Self.Id);
   function getSpritePath (Self : in GameObject) return String is (To_String(Self.SpritePath));
   function getName (Self : in GameObject) return String is (To_String(Self.Name));
   function getEntity (Self : in GameObject) return Entity.Entity is (Self.RigidBody);
   
   -- setter
   procedure setSpritePath (Self : in out GameObject; Value : in String) is
   begin
      Self.SpritePath := To_Unbounded_String(Value);
   end setSpritePath;

   procedure setName (Self : in out GameObject; Value : in String) is
   begin
      Self.Name := To_Unbounded_String(Value);
   end setName;
   
   procedure setEntity (Self : in out GameObject; Value : in Entity.Entity) is
   begin
      Self.RigidBody := Value;
   end setEntity;
   
   procedure setPosition (Self : in out GameObject; Position : Vector.Vector) is
   begin
      Self.RigidBody.Position := Position;
   end setPosition;
   
   -- private
   function init_id return Integer is
      Id : Integer := Counter;
   begin
      Counter := Counter + 1;
      return Id;
   end init_id;

end GameObject;
