with Text_IO;         use Text_IO;
with game; use game;
package body Anime is
   function Anime return Boolean is
   begin
      if game.Right then
         if isAnimated then 
            game.plum.setDisplayedSprite(3);
         else 
            game.plum.setDisplayedSprite(4);
         end if;
         
      elsif game.Left then
         if isAnimated then 
            game.plum.setDisplayedSprite(5);
         else 
            game.plum.setDisplayedSprite(6);
         end if;
      end if;
      isAnimated := not isAnimated;
      
      return True;
   end Anime;
   
end Anime;
