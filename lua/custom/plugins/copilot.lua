return {
  'github/copilot.vim',
  config = function()
    vim.g.copilot_no_tab_map = true
    vim.keymap.set('i', '<C-J>', 'copilot#Accept("\\<CR>")', {
      expr = true,
      replace_keycodes = false,
    })
    --[[ vim.keymap.set('i', '<C-E>', 'copilot#Cancel()', {
      expr = true,
      replace_keycodes = false,
    }) ]]
    vim.keymap.set('i', '<C-Up>', 'copilot#AcceptWord()', {
      expr = true,
      replace_keycodes = false,
    })
    vim.keymap.set('i', '<C-Down>', 'copilot#AcceptLine()', {
      expr = true,
      replace_keycodes = false,
    })
    vim.keymap.set('i', '<C-Right>', 'copilot#Next()', {
      expr = true,
      replace_keycodes = false,
    })
    vim.keymap.set('i', '<C-Left>', 'copilot#Previous()', {
      expr = true,
      replace_keycodes = false,
    })
    vim.keymap.set('i', '<C-Bslash>', 'copilot#Cancel()', {
      expr = true,
      replace_keycodes = false,
    })
  end,
}
