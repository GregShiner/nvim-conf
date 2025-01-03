-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Select the last pasted text
vim.keymap.set('n', 'gp', '`[v`]', { desc = 'Select the last pasted text' })

vim.keymap.set('n', '<leader>rr', function()
  vim.cmd 'write'
  if vim.bo.filetype == 'racket' then
    vim.fn.system "tmux send-keys -t {last} ',exit' Enter"
    vim.fn.system 'tmux send-keys -t {last} C-l'
    vim.fn.system("\\tmux send-keys -t {last} $'racket -i -e \\'(enter! (file \"" .. vim.fn.expand '%:p' .. "\"))\\'' Enter")
    vim.fn.system 'tmux select-pane -t {last}'
  elseif vim.bo.filetype == 'ocaml' then
    vim.fn.system "tmux send-keys -t {last} '#quit;;' Enter"
    vim.fn.system 'tmux send-keys -t {last} C-l'
    vim.fn.system("tmux send-keys -t {last} 'utop -init " .. vim.fn.expand '%:p' .. "' Enter")
    vim.fn.system 'tmux select-pane -t {last}'
  else
    print 'Unsupported filetype'
  end
end, { desc = '[R]un [R]EPL' })

vim.keymap.set('n', '<leader>rt', function()
  vim.cmd 'write'
  -- If the filetype is racket
  if vim.bo.filetype == 'racket' then
    -- Run the racket tests
    vim.fn.system "tmux send-keys -t {last} ',exit' Enter"
    vim.fn.system 'tmux send-keys -t {last} C-l'
    vim.fn.system("tmux send-keys -t {last} 'raco test " .. vim.fn.expand '%:p' .. "' Enter")
    vim.fn.system 'tmux select-pane -t {last}'
  else
    print 'Unsupported filetype'
  end
end, { desc = '[R]un [T]est' })

vim.keymap.set('n', '<leader>O', function()
  local oil = require 'oil'
  oil.open_float()
  oil.open_preview()
end, { desc = 'Open [O]il' })

vim.keymap.set('n', '<leader>L', '<cmd>LazyGit<cr>')

vim.keymap.set('n', '<leader><C-o>', '<cmd>Portal jumplist backward<cr>')
vim.keymap.set('n', '<leader><C-i>', '<cmd>Portal jumplist forward<cr>')

vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

-- vim: ts=2 sts=2 sw=2 et
