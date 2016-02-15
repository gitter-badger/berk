namespace Berk {
    public class Application: Gtk.Application {
        public Application() {
            Object(application_id: "me.shrike.berk");
        }

        protected override void activate() {
            new Berk.Window(this);
        }

        protected override void startup() {
            base.startup();

            var quit_action = new GLib.SimpleAction("quit", null);
            quit_action.activate.connect(this.quit);
            this.add_action(quit_action);

            var menu = new GLib.Menu();
            menu.append("About", "win.about");
            menu.append("Preferences", "win.preferences");
            menu.append("Quit", "app.quit");
            this.app_menu = menu;
        }
    }
}
