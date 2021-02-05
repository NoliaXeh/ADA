with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Entity;

package GameObject is
   
   Counter : Integer := 0;
   -- Contains the total number of game objects ever created
   
   type GameObject is abstract tagged limited private;
   
   -- getter
   function getId (Self : in GameObject) return Integer;
   function getSpriteId (Self : in GameObject) return Integer;
   function getName (Self : in GameObject) return String;
   function getEntity (Self : in GameObject) return Entity.Entity;
   
   --setter
   procedure setSpriteId (Self : in out GameObject; Value : in Integer);
   procedure setName (Self : in out GameObject; Value : in String)
     with Pre => Value'Length > 0;
   procedure setEntity (Self : in out GameObject; Value : in Entity.Entity);
   
private
   
   function init_id return Integer;
   -- Id := Counter then Counter + 1; return Id
   
   type GameObject is abstract tagged limited record
      Id : Integer := init_id;
      SpriteId : Integer := 0;

      Name : Unbounded_String := To_Unbounded_String("Plum");
      
      RigidBody : Entity.Entity := ( -- Default parameters for Entity
                                     HitBox => (Size => (X => 0.0, Y => 0.0)),
                                     Position => (0.0, 0.0),
                                     Forces => (0.0, 0.0),
                                     Mass => 0.0,
                                     Sp => --null                                       -- Sprite: Sprite.Sprite;
                                     (
                                      Image    => null,
                                      Panel    => null,
                                      Visible  => True,
                                      Position => (64.0, 64.0)
                                          )
                                     );
   end record;

end GameObject;
