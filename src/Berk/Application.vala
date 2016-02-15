// Berk - A terminal emulator designed for Gnome Shell.
// Copyright (c) 2015 Severen Redwood <severen.redwood@gmail.com>
//
// You should have received a copy of the GNU General Public License
// along with this program. If not, see <http://www.gnu.org/licenses/>.

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
