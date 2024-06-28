return {
  'rmagatti/auto-session',
  lazy = false,
  config = function()
    require('auto-session').setup {
      -- auto_session_last_session_dir = vim.fn.stdpath 'data' .. '/sessions/',
      auto_save_enabled = true,
      auto_restore_enabled = true,
      auto_session_use_git_branch = true,
    }
  end,
}
