{
  branches,
  icons,
  pkgs,
  ...
}:

{
  keymaps = [
    # move lines up and down with visual selection
    # [Visual] K: move up
    # [Visual] J: move down
    {
      key = "K";
      action = ":m '<-2<CR>gv=gv";
      mode = [ "v" ];
    }
    {
      key = "J";
      action = ":m '>+1<CR>gv=gv";
      mode = [ "v" ];
    }
  ];

  autoCmd = [
    {
      event = [ "BufEnter" ];
      pattern = [ "*.norg" ];
      command = "setlocal wrap";
    }
  ];

  extraPlugins = with pkgs.vimPlugins; [
    venn-nvim
    neorg-telescope
  ];

  plugins.telescope.enabledExtensions = [ "neorg" ];
  plugins.telescope.keymaps.fnw.options.desc = "Switch Neorg Workspace";
  plugins.telescope.keymaps.fnw.action = "neorg switch_workspace";
  plugins.telescope.keymaps.fni.options.desc = "Insert Neorg Link";
  plugins.telescope.keymaps.fni.action = "neorg insert_link";
  plugins.telescope.keymaps."fnI".options.desc = "Insert Neorg File Link";
  plugins.telescope.keymaps."fnI".action = "neorg insert_file_link";
  plugins.telescope.keymaps.fns.options.desc = "Find Neorg files";
  plugins.telescope.keymaps.fns.action = "neorg find_norg_files";
  plugins.telescope.keymaps.fnh.options.desc = "Find Neorg by Headings";
  plugins.telescope.keymaps.fnh.action = "neorg search_headings";
  plugins.telescope.keymaps.fnl.options.desc = "Find Neorg Linkable";
  plugins.telescope.keymaps.fnl.action = "neorg find_linkable";
  plugins.telescope.keymaps."fnB".options.desc = "Find Neorg Header Backlinks";
  plugins.telescope.keymaps."fnB".action = "neorg find_header_backlinks";
  plugins.telescope.keymaps.fnb.options.desc = "Find Neorg Backlinks";
  plugins.telescope.keymaps.fnb.action = "neorg find_backlinks";
  plugins.telescope.keymaps.fnt.options.desc = "Find Neorg Project Tasks";
  plugins.telescope.keymaps.fnt.action = "neorg find_project_tasks";
  plugins.telescope.keymaps.fnc.options.desc = "Find Neorg Context Tasks";
  plugins.telescope.keymaps.fnc.action = "neorg find_context_tasks";

  extraConfigLuaPre = # lua
    ''
      -- venn.nvim: enable or disable keymappings
      function _G.Toggle_venn()
          local venn_enabled = vim.inspect(vim.b.venn_enabled)
          if venn_enabled == "nil" then
              vim.b.venn_enabled = true
              vim.cmd[[setlocal ve=all]]
              -- draw a line on HJKL keystokes
              vim.api.nvim_buf_set_keymap(0, "n", "J", "<C-v>j:VBox<CR>", {noremap = true})
              vim.api.nvim_buf_set_keymap(0, "n", "K", "<C-v>k:VBox<CR>", {noremap = true})
              vim.api.nvim_buf_set_keymap(0, "n", "L", "<C-v>l:VBox<CR>", {noremap = true})
              vim.api.nvim_buf_set_keymap(0, "n", "H", "<C-v>h:VBox<CR>", {noremap = true})
              -- draw a box by pressing "f" with visual selection
              vim.api.nvim_buf_set_keymap(0, "v", "f", ":VBox<CR>", {noremap = true})
          else
              vim.cmd[[setlocal ve=]]
              vim.api.nvim_buf_del_keymap(0, "n", "J")
              vim.api.nvim_buf_del_keymap(0, "n", "K")
              vim.api.nvim_buf_del_keymap(0, "n", "L")
              vim.api.nvim_buf_del_keymap(0, "n", "H")
              vim.api.nvim_buf_del_keymap(0, "v", "f")
              vim.b.venn_enabled = nil
          end
      end
    '';

  plugins.which-key.settings.spec = [

    {
      __unkeyed-1 = "mp";
      __unkeyed-2 = "<cmd>MarkdownPreview<cr>";
      desc = icons.withIcon "git" "Preview Markdown";
    }

    {
      __unkeyed-1 = "<leader>tv";
      __unkeyed-2 = ":lua Toggle_venn()<CR>";
      desc = icons.withIcon "git" "Toggle Venn";
    }

    {
      __unkeyed-1 = "<leader>oj";
      __unkeyed-2 = "<cmd>Neorg journal today<cr>";
      desc = icons.withIcon "git" "Journal Today";
    }

    {
      __unkeyed-1 = "<leader>oh";
      __unkeyed-2 = "<cmd>Neorg workspace home<cr>";
      desc = icons.withIcon "git" "Open Neorg Home";
    }

    {
      __unkeyed-1 = "<leader>zm";
      __unkeyed-2 = "<cmd>ZenMode<cr>";
      desc = icons.withIcon "git" "Focus like a Japanese Philosopher 🧘";
    }

  ];

  plugins.comment.enable = true;
  plugins.zen-mode.enable = true;
  plugins.neorg = {
    enable = true;
    package = branches.master.vimPlugins.neorg;
    lazyLoading = true;
    modules = {
      "core.dirman" = {
        config = {
          default_workspace = "home";
          index = "index.norg";
          open_last_workspace = true;
          workspaces = {
            home = "~/.config/nixpkgs/notes";
            secret = "~/.config/nixpkgs/secrets";
          };

        };
      };
      "core.highlights" = { };
      "core.defaults" = {
        __empty = null;
      };
      "core.keybinds" = {
        config.neorg_leader = "<Leader>";
      };
      "core.integrations.treesitter" = {
        config.install_parsers = false;
      };
      "core.integrations.telescope" = { };
      "core.concealer" = {
        config = {
          folds = true;
          icon_preset = "diamond";
          init_open_folds = "auto";
          icons.code_block.conceal = true;
        };
      };
      "core.completion" = {
        config = {
          engine = "nvim-cmp";
        };
      };
      "core.esupports.metagen" = {
        config = {
          author = "r17x";
          type = "auto";
        };
      };
      "core.presenter" = {
        config = {
          zen_mode = "zen-mode";
        };
      };
      "core.summary" = {
        config.strategy = "by_path";
      };
      "core.ui" = { };
      "core.ui.calendar" = { };
    };
  };

  plugins.markdown-preview = {
    enable = true;
    settings.theme = "dark";
    settings.port = "8686";
  };

}
