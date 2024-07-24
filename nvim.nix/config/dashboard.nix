{ icons, ... }:
{
  plugins.dashboard = {
    enable = true;
    settings = {
      theme = "hyper";
      hide.statusline = true;
      hide.tabline = true;
      config = {
        week_header.enable = false;
        project.enable = true;
        mru.limit = 20;
        shortcut = [
          {
            key = "<S> o h";
            icon = "${icons.notes} ";
            desc = "Taking Notes ";
            action.__raw = "function(p) vim.cmd('NeorgStart') vim.cmd('Neorg index') end";
          }
          {
            key = "<S> f f";
            icon = "${icons.file} ";
            desc = "Find File ";
            action = "Telescope find_files";
          }
          {
            key = "<S> f o";
            icon = "${icons.recent} ";
            desc = "Recents ";
            action = "Telescope oldfiles";
          }
          {
            key = "<S> f g";
            icon = "${icons.word} ";
            desc = "Find Word ";
            action = "Telescope live_grep";
          }
          {
            key = "<S> f n";
            icon = "${icons.plus2} ";
            desc = "New File ";
            action = "new";
          }
          {
            key = "<S> b m";
            icon = "${icons.bookmark} ";
            desc = "Bookmarks ";
            action = "Telescope marks";
          }
          # { key = "<S> l"; icon = icons.reload; desc = "Load Last Session "; action = "SessionLoad"; }
        ];
        header = [
          "                                                              "
          "                     ░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░                    "
          "                 ░░▒▓█▓▒▒▒▒▒▒▓▓██▓▓▓▒▒▒▒▓▓▒░                  "
          "               ░▒▓█▓▒▒▓█▓▓▓▓░░░▒███████▓▓▒▒█▓▒                "
          "             ░▓██▓▒▒█████████▒░░░█████████▓▒▒██▓              "
          "           ░▓███▓▒████████████░░░▒██████████▓░▓██▓            "
          "          ▒████▒▓█████████████▓░░░▓███████████░▓███▒          "
          "         ▒████▓▒███████████████░░░░████████████░████▒         "
          "        ▒█████░███████████████▓░░░░▒███████████▒▒████▒        "
          "       ░█████▓▒███████████████▒▓▓░░░▒██████████▓░█████░       "
          "      ░██████▓▒██████████████▒▓███░░░▓██████████░██████░      "
          "      ░██████▓░█████████████░▓████▓░░░▓████████▓░██████░      "
          "      ▒███████░▓███████████░▓██████▒░░░████████▒▓██████▒      "
          "      ▒███████▒▒█████████▓░▒████████░░░░██████▓▒███████▓      "
          "      ▒███████▒▒▒███████▓░▒██████████░░░░████▓░████████▒      "
          "      ░███████▓░▒▓█████▓░░███████████▓░░░░██▒░█████████░      "
          "      ░▓██████▓▒░░▒▒▓█▓░░█████████████▒░░▒▒░▒▓█████████░      "
          "       ░███████▒▒░░░░░▒▓███████████████▒░░░▒▒█████████░       "
          "       ░▒██████▒▒░░░▒▒▒▒▒▒▒▒▒▓█▓▓▓▓▓▓▒▒▒░░░▓▒████████▒        "
          "        ░▒██████████████████▓░░░░███████████████████▒         "
          "          ░████████▓▓▓▓░░░░░░▒░░░░░░░░░░▓▓▓████████░          "
          "           ░▒████████▓▓▒░░░░░█▒▓░░░░░░░▒▓▓███████▒            "
          "             ░▒█████████▓▒▒░░▓▒▓░░░▒▓██████████▒              "
          "                ░▓███████▒▓▒▒░░░░░▒▓████████▓▒                "
          "                   ░▒▓████▓▓▒▒▓░▓▒▒█████▓▒░                   "
          "                           ▒▒▒▓▓▓▒▒                           "
          "                                                              "
        ];
      };
    };
  };
}
