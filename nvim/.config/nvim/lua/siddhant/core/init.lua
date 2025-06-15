require("siddhant.core.options")
require("siddhant.core.keymaps")

vim.opt.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
  command = "checktime"
})

