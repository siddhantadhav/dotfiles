return {
  "xiyaowong/transparent.nvim",
  lazy = false, -- load immediately so highlights apply early
  config = function()
    require("transparent").setup({
      groups = { -- default groups
        "Normal",
        "NormalNC",
        "Comment",
        "Constant",
        "Special",
        "Identifier",
        "Statement",
        "PreProc",
        "Type",
        "Underlined",
        "Todo",
        "String",
        "Function",
        "Conditional",
        "Repeat",
        "Operator",
        "Structure",
        "LineNr",
        "NonText",
        "SignColumn",
        "CursorLine",
        "CursorLineNr",
        "StatusLine",
        "StatusLineNC",
        "EndOfBuffer",
      },
      extra_groups = {
        "NvimTreeNormal",
        "NvimTreeNormalNC",
        "TelescopeNormal",
        "TelescopeBorder",
        "WhichKeyFloat",
      },
      exclude_groups = {},
    })

    -- Toggle transparency with <leader>tt
    vim.keymap.set(
      "n",
      "<leader>tt",
      ":TransparentToggle<CR>",
      { silent = true, desc = "Toggle transparency" }
    )
  end,
}
