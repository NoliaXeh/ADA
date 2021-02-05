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
      Key := Event.Keyval;
      if Key = Gdk_Down then
         null;
      elsif Key = Gdk_Up then
         null;
      elsif Key = Gdk_Left then
         Apply_Force(Game.Player, (-200.0, 0.0));
         null;
      elsif Key = Gdk_Right then
         Apply_Force(Game.Player, (200.0, 0.0));
         null;
      elsif Key = Gdk_Space then
         Apply_Force(Game.Player, (0.0, -100.0));
         null;
      end if;
      return True;
   end Process_Key_Press;


end inputEvent;
