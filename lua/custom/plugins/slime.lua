return {
  'jpalardy/vim-slime',
  enabled = false,
  config = function()
    vim.g.slime_target = 'tmux'
  end,
}
