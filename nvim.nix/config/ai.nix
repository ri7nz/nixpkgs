{ icons, ... }:

{
  plugins.avante.enable = true;
  plugins.avante.settings.provider = "claude";
  plugins.avante.settings.claude.api_key_name = "cmd:pass show r17x/anthropic";
  plugins.avante.settings.claude.endpoint = "https://api.anthropic.com";
  plugins.avante.settings.claude.model = "claude-3-5-sonnet-20240620";
  plugins.avante.settings.claude.temperature = 0;
  plugins.avante.settings.claude.max_tokens = 4096;

  plugins.which-key.settings.spec = [

    {
      __unkeyed-1 = "<leader>ca";
      __unkeyed-2 = "<cmd>AvanteAsk<cr>";
      icon = icons.space.right "robotFace";
      desc = "Open AI Ask";
    }

    {
      __unkeyed-1 = "<leader>cc";
      __unkeyed-2 = "<cmd>AvanteChat<cr>";
      icon = icons.space.right "robotFace";
      desc = "Open AI Chat";
    }

    {
      __unkeyed-1 = "<leader>ce";
      __unkeyed-2 = "<cmd>AvanteEdit<cr>";
      icon = icons.space.right "robotFace";
      desc = "Edit with instruction";
    }

    {
      __unkeyed-1 = "<leader>cg";
      __unkeyed-2 = "<cmd>ChatGPTRun grammar_correction<cr>";
      icon = icons.space.right "robotFace";
      desc = "Grammar Correction";
    }

    {
      __unkeyed-1 = "<leader>ct";
      __unkeyed-2 = "<cmd>ChatGPTRun translate<cr>";
      icon = icons.space.right "robotFace";
      desc = "Translate";
    }

    {
      __unkeyed-1 = "<leader>ck";
      __unkeyed-2 = "<cmd>ChatGPTRun keywords<cr>";
      icon = icons.space.right "robotFace";
      desc = "Keywords";
    }

    {
      __unkeyed-1 = "<leader>cd";
      __unkeyed-2 = "<cmd>ChatGPTRun docstring<cr>";
      icon = icons.space.right "robotFace";
      desc = "Docstring";
    }

    {
      __unkeyed-1 = "<leader>co";
      __unkeyed-2 = "<cmd>ChatGPTRun optimize_code<cr>";
      icon = icons.space.right "robotFace";
      desc = "Optimize Code";
    }

    {
      __unkeyed-1 = "<leader>cs";
      __unkeyed-2 = "<cmd>ChatGPTRun summarize<cr>";
      icon = icons.space.right "robotFace";
      desc = "Summarize";
    }

    {
      __unkeyed-1 = "<leader>cf";
      __unkeyed-2 = "<cmd>ChatGPTRun fix_bugs<cr>";
      icon = icons.space.right "robotFace";
      desc = "Fix Bugs";
    }

    {
      __unkeyed-1 = "<leader>cx";
      __unkeyed-2 = "<cmd>ChatGPTRun explain_code<cr>";
      icon = icons.space.right "robotFace";
      desc = "Explain Code";
    }

    {
      __unkeyed-1 = "<leader>cr";
      __unkeyed-2 = "<cmd>ChatGPTRun roxygen_edit<cr>";
      icon = icons.space.right "robotFace";
      desc = "Roxygen Edit";
    }

    {
      __unkeyed-1 = "<leader>cl";
      __unkeyed-2 = "<cmd>ChatGPTRun code_readability_analysis<cr>";
      icon = icons.space.right "robotFace";
      desc = "Code Readability Analysis";
    }
  ];
}
