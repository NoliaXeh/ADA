--with Sprite;

package body Block is
   
   --procedure placeBlock (Self : in Block; Layer : in out Gtk_Fixed) is
   --begin
      --Layer.Put(Widget => Sprite.getSprite(Self.getSpriteId),
       --         X      => Self.getMesh.Position.X,
     --           Y      => Self.getMesh.Position.Y);
   --end placeBlock;

   -- getter
   function getNature(Self : in Block) return Integer is (Self.Nature);
   
   -- setter
   procedure setNature (Self : in out Block; Value : in Integer) is
   begin
      Self.Nature := Value;
   end setNature;
   
   -- private

end Block;
