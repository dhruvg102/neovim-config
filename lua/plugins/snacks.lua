return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = { enabled = true },
      quickfile = { enabled = true },
      picker = { enabled = true },
    },
    keys = {
      { "<leader><space>", function() Snacks.picker.smart() end,                                   desc = "Smart Find Files" },
      { "<leader>sk",      function() Snacks.picker.keymaps() end,                                 desc = "Keymaps" },
      { "<leader>sh",      function() Snacks.picker.help() end,                                    desc = "Help Pages" },
      { "<leader>sw",      function() Snacks.picker.grep_word() end,                               desc = "Visual selection or word", mode = { "n", "x" } },
      { "<leader>sg",      function() Snacks.picker.grep() end,                                    desc = "Grep" },
      { "<leader>sd",      function() Snacks.picker.diagnostics() end,                             desc = "Diagnostics" },
      { "<leader>fg",      function() Snacks.picker.git_files() end,                               desc = "Find Git Files" },
      { "<leader>fp",      function() Snacks.picker.projects() end,                                desc = "Projects" },
      { "<leader>fb",      function() Snacks.picker.buffers() end,                                 desc = "Buffers" },
      { "<leader>fr",      function() Snacks.picker.recent() end,                                  desc = "Recent" },
      { "<leader>fc",      function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },

    },
  },
  {
    "snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = [[

   ██╗  ██╗██╗███████╗██████╗  ██████╗ ████████╗███████╗ ██████╗██╗  ██╗
   ██║  ██║██║██╔════╝██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝██╔════╝██║  ██║
   ███████║██║█████╗  ██████╔╝██║   ██║   ██║   █████╗  ██║     ███████║
   ██╔══██║██║██╔══╝  ██╔══██╗██║   ██║   ██║   ██╔══╝  ██║     ██╔══██║
   ██║  ██║██║██║     ██║  ██║╚██████╔╝   ██║   ███████╗╚██████╗██║  ██║
   ╚═╝  ╚═╝╚═╝╚═╝     ╚═╝  ╚═╝ ╚═════╝    ╚═╝   ╚══════╝ ╚═════╝╚═╝  ╚═╝

          ]],
          ---@type snacks.dashboard.Item[]
          keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
            { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
            { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
        },
      },
    },
  },
  {
    "snacks.nvim",
    opts = {},
    keys = {
      { "<leader>cR", function() Snacks.rename.rename_file() end,           desc = "Rename File" },
      -- LSP
      { "gd",         function() Snacks.picker.lsp_definitions() end,       desc = "Goto Definition" },
      { "gD",         function() Snacks.picker.lsp_declarations() end,      desc = "Goto Declaration" },
      { "gr",         function() Snacks.picker.lsp_references() end,        nowait = true,                  desc = "References" },
      { "gI",         function() Snacks.picker.lsp_implementations() end,   desc = "Goto Implementation" },
      { "gy",         function() Snacks.picker.lsp_type_definitions() end,  desc = "Goto T[y]pe Definition" },
      { "<leader>ss", function() Snacks.picker.lsp_symbols() end,           desc = "LSP Symbols" },
      { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
      -- Terminal
      { "<space>tt",  function() Snacks.terminal() end,                     desc = "Toggle Terminal" },
      { "<c-_>",      function() Snacks.terminal() end,                     desc = "which_key_ignore" },
      -- git
      { "<leader>gl", function() Snacks.picker.git_log() end,               desc = "Git Log" },
      { "<leader>gL", function() Snacks.picker.git_log_line() end,          desc = "Git Log Line" },
      { "<leader>gs", function() Snacks.picker.git_status() end,            desc = "Git Status" },
      { "<leader>gd", function() Snacks.picker.git_diff() end,              desc = "Git Diff (Hunks)" },
      { "<leader>gf", function() Snacks.picker.git_log_file() end,          desc = "Git Log File" },
      { "<leader>gb", function() Snacks.git.blame_line() end,               desc = "Git Blame Line" },
      { "<leader>gB", function() Snacks.gitbrowse() end,                    desc = "Git Browse" },
    },

    init = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        callback = function()
          -- Setup some globals for debugging (lazy-loaded)
          _G.dd = function(...)
            Snacks.debug.inspect(...)
          end
          _G.bt = function()
            Snacks.debug.backtrace()
          end
          vim.print = _G.dd -- Override print to use snacks for `:=` command

          -- Create some toggle mappings
          Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
          Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
          Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
          Snacks.toggle.diagnostics():map("<leader>ud")
          Snacks.toggle.line_number():map("<leader>ul")
          Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map(
            "<leader>uc")
          Snacks.toggle.treesitter():map("<leader>uT")
          Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
          Snacks.toggle.inlay_hints():map("<leader>uh")
        end,
      })
    end,
  }
}
