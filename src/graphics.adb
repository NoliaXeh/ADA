with Maps; use Maps;
with Gtk.Fixed;       use Gtk.Fixed;
with Gtk.Image;       use Gtk.Image;
with Gdk.Pixbuf; use Gdk.Pixbuf;
with Game; use Game;
with block; use block;
with Glib.Error;      use Glib.Error;
with Gdk.Event;       use Gdk.Event;

with Ada.Long_Float_Text_IO;
with Gtk.Box;         use Gtk.Box;
with Gtk.Label;       use Gtk.Label;
with Gtk.Widget;      use Gtk.Widget;
with Gtk.Main;
with Gtk.Window;      use Gtk.Window;
with Gtk.Image;       use Gtk.Image;
with Gtk.Fixed;       use Gtk.Fixed;
with Gtk.Layout;      use Gtk.Layout;
with Gtk.Handlers;
with Glib;            use Glib;

with Glib.Object; use Glib.Object;
with Ada.Text_IO; use Ada.Text_IO;
with Anime; use Anime;

with Block; use Block;
with Game; use Game;

with Ada.Containers.Hashed_Maps;  use Ada.Containers;
with Maps;  use Maps;
with File;  use File;
with inputEvent;  use inputEvent;
with inputEvent;  use inputEvent;

with Sprite;      use Sprite;

with Foe; use Foe;

WITH Gtk.Main ;          USE Gtk.Main ;
WITH Gdk.Types ;               USE Gdk.Types;
WITH Gdk.Types.Keysyms ;       USE Gdk.Types.Keysyms ;
with Gdk.Event; use Gdk.Event;
with gtk.Button; use gtk.button;

WITH Gtk.Handlers ;






package body Graphics
with SPARK_Mode => Off -- GTK
is
   procedure fill_screen(map: in Maps.Map) is
   begin
      Maps.fill_screen(map);
   end fill_screen;
   procedure set_image(panel : Gtk_Fixed; image: in String) is 
      img : Gtk_Image;
      Buf : Gdk_Pixbuf;
      er: Glib.Error.GError;
   begin
      Gdk_New_From_File (Buf, image, er);
      Buf := Scale_Simple(Src         => Buf,
                          Dest_Width  => Game.Win_Width,
                          Dest_Height => Game.Win_Height,
                          Inter_Type  => Interp_Bilinear);
      Gtk_New (Img, Buf);
      panel.Put(Widget => img,
                 X      => 0,
                 Y      => 0);
   end set_image;
   
   procedure init(map : Maps.Map) is
      Win           : Gtk_Window;
      Layout        : Gtk_Layout;
      Fixed         : Gtk_Fixed;
      Fixed_Back    : Gtk_Fixed;
      Fixed_Mid     : Gtk_Fixed;
      Fixed_Entities: Gtk_Fixed;
      Fixed_Front   : Gtk_Fixed;
      Fixed_Start   : Gtk_Fixed;
      Fixed_Pause   : Gtk_Fixed;
      Fixed_Win     : Gtk_Fixed;
      Fixed_Loose   : Gtk_Fixed;
      Life          : Gtk_Label;
   begin
      -- Create a window and set size
      Gtk_New (Win);
      Win.Set_Default_Size (Game.Win_Width, Game.Win_Height);
      
      -- Set name
      win.Set_Title("ADAPlum");
      
      --- Main Layout, only thing attafched to the Window
      Gtk_New (Layout);
      Win.add(Layout);
      
      --- Create others widgets
      Gtk_New (Fixed);
      Gtk_New (Fixed_Back);
      Gtk_New (Fixed_Mid);
      Gtk_New (Fixed_Entities);
      Gtk_New (Fixed_Front);
      Gtk_New (Fixed_Start);
      Gtk_New (Fixed_Pause);
      Gtk_New (Fixed_Loose);
      Gtk_New (Fixed_Win);
      Gtk_New (Life);
      
      --Set default value 
      Set_Text (Life, "XXX");
      
      --Fixe panel
      Layout.Put (Fixed_Back, 0, 0);
      Layout.Put (Fixed, 0, 0);
      Fixed.Put (Fixed_Mid, 0, 0);
      Layout.Put (Fixed_Entities, 0, 0);
      Layout.Put (Life, 0, 0);
      Fixed.Put (Fixed_Front, 0, 0);
      Layout.Put(Child_Widget => Fixed_Start,X => 0,Y => 0);
      Layout.Put(Child_Widget => Fixed_Pause,X => 0,Y => 0);
      Layout.Put (Fixed_Win, 0, 0);
      Layout.Put (Fixed_Loose, 0, 0);
      
      -- fill panel
      Graphics.set_image (panel => Fixed_Back, image    => "background.png");
      Graphics.set_image (panel => Fixed_Start, image    => "background.png");
      Graphics.set_image (panel => Fixed_Start, image    => "Start.png");
      Graphics.set_image (panel => Fixed_Pause, image    => "Pause.png");
      Graphics.set_image (panel => Fixed_Loose, image    => "background.png");
      Graphics.set_image (panel => Fixed_Loose, image    => "Loose.png");
      Graphics.set_image (panel => Fixed_Win, image    => "background.png");
      Graphics.set_image (panel => Fixed_Win, image    => "Win.png");
      
      --- Setup Globals for the Game Loop
      Game.Fixed := Fixed;
      Game.Fixed_Mid := Fixed_Mid;
      Game.Fixed_Back := Fixed_Back;
      Game.Fixed_Front := Fixed_Front;
      Game.Layout := Layout;
      Game.Fixed := Fixed;
      Game.Fixed_Mid := Fixed_Mid;
      Game.Fixed_Back := Fixed_Back;
      Game.Fixed_Front := Fixed_Front;
      Game.Fixed_Entities := Fixed_Entities;
      Game.Fixed_Start := Fixed_Start;
      Game.Fixed_Pause := Fixed_Pause;
      Game.Fixed_Win := Fixed_Win;
      Game.Fixed_Loose := Fixed_Loose;
      Game.Start := False;
      Game.Layout := Layout;
      Game.win := win;
      Game.plum.getEntity.Sp := Sprite.Sprite_New ( Path   => "Pink/hitbox.png", --"Pink/alienPink_stand.png",
                                                 Panel  => Fixed_Entities,
                                                 Size_X => 64,
                                                 Size_Y => 128);
      Game.plum.getEntity.Sp.Panel.Move (Game.plum.getEntity.Sp.Img, Game.Win_Width / 2, Game.Win_Height / 2 -64);
      Game.plum.getEntity.Position := (128.0, 512.0);
      Game.plum.getEntity.Forces := (1.0, 0.0);
      Game.Delta_Time := 0.0;
      Game.Life := Life;
      
      --Game.Mechant.setPosition((20.0 * 64.0, 128.0));
      --Game.Mechant.initSpriteList;
      
      --init block pos
      Graphics.fill_screen (map => map);
      
      --Game.Mechant.initSpriteList;
      for F of Game.Foe_List loop
         F.initSpriteList;
      end loop;
      
      Win.Show_All;
      Win.Present;
      Fixed_Pause.Set_Visible(False);
      Fixed_Loose.Set_Visible(False);
      Fixed_Win.Set_Visible(False);
      Game.plum.setDisplayedSprite(1);
      --EVENT
      Win.On_Delete_Event (Delete_Event_Cb'Unrestricted_Access);
      win.On_Key_Press_Event(Process_Key_Press'Unrestricted_Access);
      win.On_Key_Release_Event(Process_Key_Release'Unrestricted_Access);

   end init;
   

end Graphics;
