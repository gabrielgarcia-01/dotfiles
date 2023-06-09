return {
  -- lsp config
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        bashls = {},
        clangd = {},
        gopls = {},
        jdtls = {},
        pyright = {},
        marksman = {},
        rust_analyzer = {},
        zls = {},
      },
    },
  },
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    version = false, -- last release is way too old and doesn't work on Windows
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter-textobjects",
        init = function()
          -- PERF: no need to load the plugin, if we only need its queries for mini.ai
          local plugin = require("lazy.core.config").spec.plugins["nvim-treesitter"]
          local opts = require("lazy.core.plugin").values(plugin, "opts", false)
          local enabled = false
          if opts.textobjects then
            for _, mod in ipairs({ "move", "select", "swap", "lsp_interop" }) do
              if opts.textobjects[mod] and opts.textobjects[mod].enable then
                enabled = true
                break
              end
            end
          end
          if not enabled then
            require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
          end
        end,
      },
      "HiPhish/nvim-ts-rainbow2",
    },
    keys = {
      { "<c-space>", desc = "Increment selection" },
      { "<bs>", desc = "Decrement selection", mode = "x" },
    },
    ---@type TSConfig
    opts = {
      highlight = { enable = true },
      indent = { enable = true, disable = { "python" } },
      context_commentstring = { enable = true, enable_autocmd = false },
      ensure_installed = {
        "bash",
        "c",
        "cpp",
        "go",
        "haskell",
        "java",
        "json",
        "lua",
        "luap",
        "luadoc",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "rust",
        "vim",
        "yaml",
        "zig",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = "<nop>",
          node_decremental = "<bs>",
        },
      },
      rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
      },
    },
    ---@param opts TSConfig
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  -- formatting
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason.nvim" },
    opts = function()
      local nls = require("null-ls")
      return {
        root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
        sources = {
          nls.builtins.formatting.fish_indent,
          nls.builtins.diagnostics.fish,
          nls.builtins.formatting.stylua,
          nls.builtins.formatting.shfmt,
          nls.builtins.diagnostics.flake8,
          nls.builtins.formatting.gofmt,
          nls.builtins.formatting.rustfmt,
          nls.builtins.formatting.clang_format,
          nls.builtins.formatting.cbfmt,
        },
      }
    end,
  },
  -- haskell
  {
    "mrcjkb/haskell-tools.nvim",
  },
  -- yuck
  {
    "elkowar/yuck.vim",
  },
}
