return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },

  opts = {},

  keys = function()
    local harpoon = require("harpoon")
    local keys = {
      {
        "<leader>A",
        function()
          harpoon:list():add()
        end,
        desc = "harpoon file",
      },
      {
        "<leader>a",
        function()
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "harpoon quick menu",
      },
    }

    for i = 1, 9 do
      table.insert(keys, {
        "<leader>" .. i,
        function()
          harpoon:list():select(i)
        end,
        desc = "harpoon " .. i,
      })
    end

    return keys
  end,
}
