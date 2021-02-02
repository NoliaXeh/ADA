with Entity;

package GameObject is
   
   Counter : Integer := 0;
   -- Contains the total number of game objects ever created
   
   type GameObject is abstract tagged limited private;
   
   -- getter
   function getId (Self : in GameObject) return Integer;
   function getSpriteId (Self : in GameObject) return Integer;
   function getMesh (Self : in GameObject) return Entity.Entity;
   
   --setter
   procedure setSpriteId (Self : in out GameObject; Value : in Integer);
   procedure setMesh (Self : in out GameObject; Value : in Entity.Entity);
   
private
   
   function init_id return Integer;
   -- Id := Counter then Counter + 1; return Id
   
   type GameObject is abstract tagged limited record
      Id : Integer := init_id;
      SpriteId : Integer := 0;
      
      Mesh : Entity.Entity := ( -- Default parameters for Entity
                      HitBox => (Size => (X => 0.0, Y => 0.0)),
                      Position => (0.0, 0.0),
                      Forces => (0.0, 0.0),
                      Mass => 0.0,
                      Sprite => null);
   end record;

end GameObject;
