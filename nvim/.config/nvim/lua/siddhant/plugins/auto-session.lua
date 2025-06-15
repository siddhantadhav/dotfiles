return {
  "rmagatti/auto-session",
  config = function()
    local auto_session = require("auto-session")

    -- auto_session.setup({
    --   auto_restore_enabled = true,                   
    --   auto_session_suppress_dirs = { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/" },
    -- })

    -- auto_session.setup({
    --   log_level = "error",
    --   auto_session_enable_last_session = false,
    --   auto_restore_enabled = true,
    --   auto_save_enabled = true,
    --   auto_session_suppress_dirs = { "~/", "~/Downloads", "~/Documents", "~/Desktop" },
    --   auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/", -- You said sessions are stored here
    -- })
    --

    auto_session.setup({
      log_level = "error",
      auto_restore_enabled = true,
      auto_save_enabled = true,
      auto_session_enable_last_session = false,
      auto_session_suppress_dirs = { "~/", "~/Downloads", "~/Documents", "~/Desktop" },
      auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
      auto_session_use_git_branch = false,
      auto_session_enabled = true,
      -- transform_path = true, -- 🔥 Required for %2F style paths
    })

    local keymap = vim.keymap

    keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" }) -- restore last workspace session for current directory
    keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir" }) -- save workspace session for current working directory
  end,
}
