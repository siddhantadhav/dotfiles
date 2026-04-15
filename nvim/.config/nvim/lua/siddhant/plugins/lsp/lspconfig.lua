return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim",                   opts = {} },
    "mason-org/mason-lspconfig.nvim",
  },
  config = function()
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local keymap = vim.keymap

    local function go_format_and_imports()
      vim.lsp.buf.format({ async = false })
      local params = {
        context = { only = { "source.organizeImports" } },
        apply = true,
      }
      local result = vim.lsp.buf.code_action(params)
      vim.api.nvim_buf_call(0, function()
        vim.cmd("update")
      end)
    end

    -- LSP keymaps applied on attach
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }

        keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
        keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
        keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
        keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
        keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        keymap.set("n", "K", vim.lsp.buf.hover, opts)
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
        keymap.set({ "n", "v" }, "<leader>lf", function() vim.lsp.buf.format({ async = true }) end, opts)
      end,
    })

    -- enable autocompletion capabilities for all servers
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- configure LSP servers with vim.lsp.config() (Neovim v0.11+)
    -- default capabilities for all servers
    vim.lsp.config("*", {
      capabilities = capabilities,
    })

    -- lua_ls specific configuration
    vim.lsp.config("lua_ls", {
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
          telemetry = { enable = false },
        },
      },
    })

    vim.lsp.config("gopls", {
      capabilities = capabilities,
      settings = {
        gopls = {
          gofumpt = true,
          analyses = {
            unusedparams = true,
          },
        },
      },
      -- auto format + organize imports on save
      on_attach = function(client, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          callback = go_format_and_imports,
        })
      end,
    })

    -- modern diagnostic signs (replaces vim.fn.sign_define)
    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = " ",
          [vim.diagnostic.severity.WARN]  = " ",
          [vim.diagnostic.severity.HINT]  = "󰠠 ",
          [vim.diagnostic.severity.INFO]  = " ",
        },
      },
    })

    -- LSP servers are auto-configured via mason-lspconfig automatic_enable
  end,
}
