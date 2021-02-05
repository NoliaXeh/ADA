WITH Gtk.Main ;          USE Gtk.Main ;
WITH Gtk.Window ;        USE Gtk.Window ;
WITH Gtk.Widget ;           USE Gtk.Widget ;
WITH Gdk.Types ;               USE Gdk.Types;
WITH Gdk.Types.Keysyms ;       USE Gdk.Types.Keysyms ;
with Gdk.Event; use Gdk.Event;
WITH Gtk.Handlers ;
with gtk.Box; use Gtk.box;

package inputEvent
with SPARK_Mode => Off -- GTK
is

   function Process_Key_Press( Self: access Gtk_Widget_Record'Class;
                               Event: Gdk.Event.Gdk_Event_Key ) return Boolean;





end inputEvent;
