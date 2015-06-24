using GLib;
using Gtk;
using WebKit;

public class Browser : Window {
    private const string URL = "https://www.roblox.com/";
    private Notebook notebook;
    public Browser() {
        this.create_views();
        this.destroy += Gtk.main_quit;
    }

    private void create_views() {
        this.notebook = new Notebook();
        for (int x = 0; x < 4; x++) {
            this.notebook.append_page(
                this.create_web_window(),
                new Label("Tab %u".printf(x))
            );
        }
        this.add(this.notebook);
    }

    private ScrolledWindow create_web_window() {
        var view = new WebView();
        view.open(Browser.URL);
        var scrolled_window = new ScrolledWindow(null, null);
        scrolled_window.set_policy(PolicyType.AUTOMATIC, PolicyType.AUTOMATIC);
        scrolled_window.add(view);
        return scrolled_window;
    }

    public static int main(string[] args) {
        Gtk.init(ref args);
        var browser = new Browser();
        browser.title = "Roblox Browser";
        browser.window_position = WindowPosition.CENTER;
        browser.set_default_size (1024, 576);
        browser.show_all();
        Gtk.main();
        return 0;
    }
}
