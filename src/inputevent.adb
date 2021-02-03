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

package body inputEvent is 
   function Process_Key_Press( Self: access Gtk_Widget_Record'Class;
                                Event: Gdk.Event.Gdk_Event_Key ) return Boolean is
      Key: Gdk.Types.Gdk_Key_type;
      pragma Unreferenced (Self);
   begin
      Key := Event.Keyval;
      if Key = Gdk_Down then
            game.Layout.Move (Fixed, 0, Gint(64));
      elsif Key = Gdk_Up then
         game.Layout.Move (Fixed, 0, -Gint(64));
      elsif Key = Gdk_Left then
         game.Layout.Move (Fixed, -Gint(64), 0);
      elsif Key = Gdk_Right then
         game.Layout.Move (Fixed, Gint(64), 0);
      elsif Key = Gdk_Space then
            Put_Line("space");
      end if;
      return True;
   end Process_Key_Press;
   

end inputEvent;
