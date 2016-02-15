namespace Berk {
    public class Window: Gtk.ApplicationWindow {
        public Window(Berk.Application app) {
            Object(application: app, title: "Berk");

            // Initial window setup
            this.set_default_size(800, 600);
            this.window_position = Gtk.WindowPosition.CENTER;
            this.set_border_width(10);

            // Create the headerbar
            Gtk.HeaderBar headerBar = new Gtk.HeaderBar();
            headerBar.title = "Berk";
            headerBar.show_close_button = true;
            this.set_titlebar(headerBar);

            var terminal = new Vte.Terminal();
            terminal.child_exited.connect ( (t)=> { app.quit(); } );
            terminal.spawn_sync(Vte.PtyFlags.DEFAULT,
                                null,
                                {"/usr/bin/fish"},
                                null,
                                GLib.SpawnFlags.DO_NOT_REAP_CHILD,
                                null,
                                null);
            this.add(terminal);

            var about_action = new GLib.SimpleAction("about", null);
            about_action.activate.connect(() => {
                string[] authors = { "Severen Redwood &lt;severen@shrike.me&gt;", null };
                string[] documenters = { "Severen Redwood &lt;severen@shrike.me&gt;", null };

                Gtk.show_about_dialog(
                    this,
                    "program-name", ("Berk"),
                    "copyright", ("Copyright \xc2\xa9 2016 Severen Redwood"),
                    "authors", authors,
                    "documenters", documenters,
                    "website", "https://github.com/SShrike/berk",
                    "website-label", "Berk GitHub Repository",
                    null
                );
            });

            var preferences_action = new GLib.SimpleAction("preferences", null);
            preferences_action.activate.connect(() => {
                stdout.printf("Unimplemented\n");
            });

            this.add_action(about_action);
            this.add_action(preferences_action);
            this.show_all();
        }
    }
}
