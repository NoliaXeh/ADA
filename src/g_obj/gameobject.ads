with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Entity;
with Vector;

package GameObject
with SPARK_Mode => Off -- Entity and Pre ?
is
   
   Counter : Integer := 0;
   -- Contains the total number of game objects ever created
   
   type GameObject is abstract tagged private;
   
   type Entity_Ref (Element : not null access Entity.Entity) is null record
     with Implicit_Dereference => Element;
   
   -- getter
   function getId (Self : in GameObject) return Integer;
   function getSpritePath (Self : in GameObject) return String;
   function getName (Self : in GameObject) return String;
   function getEntity (Self : in GameObject) return Entity_Ref;
   
   --setter
   procedure setSpritePath (Self : in out GameObject; Value : in String)
     with Pre => Value'Length > 0;
   procedure setName (Self : in out GameObject; Value : in String)
     with Pre => Value'Length > 0;
   procedure setEntity (Self : in out GameObject; Value : in Entity.Entity);
   procedure setPosition (Self : in out GameObject; Position : Vector.Vector);
   
private
   
   function init_id return Integer;
   -- Id := Counter then Counter + 1; return Id
   
   type GameObject is abstract tagged record
      Id : Integer := init_id;
      
      SpritePath : Unbounded_String := To_Unbounded_String("Pink/alienPink_stand.png");
      Name : Unbounded_String := To_Unbounded_String("Plum");
      
      RigidBody : Entity.Entity := ( -- Default parameters for Entity
                                     HitBox => (Size => (X => 64.0, Y => 64.0)),
                                     Position => (0.0, 0.0),
                                     Forces => (0.0, 0.0),
                                     Mass => 0.0,
                                     Sp => -- Sprite.Sprite
                                     (
                                      Panel    => null,
                                      Test    => null,
                                      Visible  => True,
                                      Position => (64.0, 64.0)
                                     )
                                    );
   end record;

end GameObject;
