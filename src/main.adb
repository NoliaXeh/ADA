with Glib;            use Glib;
with Glib.Main;       use Glib.Main;
with Glib.Object; use Glib.Object;
with Maps;  use Maps;
with File;  use File;
with Game; use Game;
with Graphics; use Graphics;
with Anime; use Anime;
with Gtk.Main;

with Foe; use Foe;

procedure Main is
   gameLoop          : G_Source_Id;
   animationLoop          : G_Source_Id;
   isInit : Boolean := False;

   Output:Maps.Map;

begin
   <<Beginning>>

   --  Initialize GtkAda.
   Gtk.Main.Init;
   --read map
   File.Read_File (Path => "src/map.txt", Output => Output);
   Game.Map := Output;

   --init all
   Graphics.init(Output);

   --- Setting up game Loop, ignore returned value

   --- 60 FPS => 1000/60 ms between each frames => 16ms
   gameLoop := Glib.Main.Timeout_Add(Interval => 16, -- ms
                                 Func     => Game.Game'Access);
   ---
   if not isInit then
      animationLoop := Glib.Main.Timeout_Add(Interval => 128, -- ms
                                          Func     => Anime.Anime'Access);
      isInit := True;
   end if;
   --  Start the Gtk+ main loop
      --  Show the window and present it
   Gtk.Main.Main;

   if Game.isWin then
      Game.Win.Destroy;
      Game.isWin := False;
      Game.Foe_List.Clear;
      Game.plum.setHp(Game.plum.getMaxHp);
      goto Beginning;
   end if;

end Main;
