return {
  "Exafunction/codeium.nvim",
  event = "InsertEnter",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("codeium").setup({
      enable_cmp_source = true,
      virtual_text = { enabled = false },
    })
  end,
}
