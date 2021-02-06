WITH Gtk.Main ;          USE Gtk.Main ;
WITH Gtk.Window ;        USE Gtk.Window ;
WITH Gtk.Widget ;           USE Gtk.Widget ;
WITH Gdk.Types ;               USE Gdk.Types;
WITH Gdk.Types.Keysyms ;       USE Gdk.Types.Keysyms ;
with Gdk.Event; use Gdk.Event;
WITH Gtk.Handlers ;
with Ada.Text_IO; use Ada.Text_IO;
with game; use Game;
with Glib;            use Glib;
with Game; use Game;
with Entity; use Entity;

package body inputEvent
with SPARK_Mode => Off -- GTK
is
   function Process_Key_Press( Self: access Gtk_Widget_Record'Class;
                                Event: Gdk.Event.Gdk_Event_Key ) return Boolean is
      Key: Gdk.Types.Gdk_Key_type;
      pragma Unreferenced (Self);
   begin
      if (not Game.Start) then
         Game.Start := True;
         Game.Fixed_Start.Set_Visible(False);
         Game.Delta_Time := 1.0 / 60.0;
         return True;
      end if;

      Key := Event.Keyval;
      if Key = Gdk_Down then
         null;
      elsif Key = Gdk_Up then
         Game.Up := True;
         null;
      elsif Key = Gdk_Left then
         Game.Left := True;
         null;
      elsif Key = Gdk_Right then
         Game.Right := True;
         null;
      elsif Key = GDK_Escape then
         if Game.Delta_Time = 0.0 then
            Game.Fixed_Pause.Set_Visible(False);
            Game.Delta_Time := 1.0 / 60.0;
         else
            Game.Fixed_Pause.Set_Visible(True);
            Game.Delta_Time := 0.0;
         end if;
         null;
      --end if;
      --if Key = Gdk_Space then
      elsif Key = Gdk_Space then
         Game.Up := True;
         --Game.Player.Position.Y := Game.Player.Position.Y - 0.2;
         --Apply_Force(Game.Player, (0.0, -640.0));
         null;
      end if;
      return True;
   end Process_Key_Press;

   function Process_Key_Release( Self: access Gtk_Widget_Record'Class;
                                Event: Gdk.Event.Gdk_Event_Key ) return Boolean is
      Key: Gdk.Types.Gdk_Key_type;
      pragma Unreferenced (Self);
   begin
      Key := Event.Keyval;
      if Key = Gdk_Left then
         Game.Left := False;
         null;
      elsif Key = Gdk_Right then
         Game.Right := False;
         null;
      elsif Key = Gdk_Space or Key = Gdk_Up then
         Game.Up := False;
         null;
      end if;
      return True;
   end Process_Key_Release;



end inputEvent;
