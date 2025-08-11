-- #1 Plugins
vim.pack.add({
  { src = "https://github.com/ibhagwan/fzf-lua" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/vim-airline/vim-airline" },
  { src = "https://github.com/akinsho/bufferline.nvim" },
  { src = "https://github.com/AlexvZyl/nordic.nvim" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons" }, -- skal ordne egen 
  { src = "https://github.com/nvimdev/dashboard-nvim" }, -- skal ordne egen
  { src = "https://github.com/windwp/nvim-autopairs" },

  -- { src = "https://github.com/nvim-lua/plenary.nvim" },
  -- { src = "https://github.com/nvim-telescope/telescope.nvim" },
})

-- *1 Pluginmanagement
vim.keymap.set('n', '<M-p>', ':!rm -r ~/.local/share/nvim<CR> :call ShowFloatMessage("You deleted .local/share/nvim")<CR>')
vim.cmd([[
function! ShowFloatMessage(msg)
let width = 30
let height = 1
let buf = nvim_create_buf(v:false, v:true)
let ui = nvim_list_uis()[0]
let opts = {
\ 'relative': 'editor',
\ 'width': width,
\ 'height': height,
\ 'col': (ui.width / 2) - (width / 2),
\ 'row': (ui.height / 6) - (height / 4),
\ 'style': 'minimal',
\ }
let win = nvim_open_win(buf, 1, opts)
call nvim_buf_set_lines(buf, 0, -1, v:true, [a:msg])
endfunction
]])


-- #2 Options
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.wrap = false
vim.o.tabstop = 2
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.g.mapleader = " "
vim.o.cursorline = true
vim.o.termguicolors = true
vim.o.scrolloff = 8
vim.o.winborder = "rounded"
-- *2 undo and micelanious options
vim.cmd([[ set undodir=~/.vim/undo-di ]])
vim.cmd([[ set undofile ]])
vim.cmd([[ tnoremap <M-Esc> <C-\><C-n> ]])
vim.cmd([[ autocmd VimEnter * hi Visual guifg=magenta ]])
vim.cmd([[ highlight DiagnosticError guifg=BrightRed ]])


-- #3 Naviagtion
vim.keymap.set('n', '<C-n>', ':bn <CR>')
vim.keymap.set('n', '<C-c>', ':bdelete <CR>')
vim.keymap.set('n', '<leader>1', ':q<CR>')
vim.keymap.set('n', '<M-c>', ':bdelete! <CR>')
vim.keymap.set('n', '<F2>', ':terminal <CR>')
vim.keymap.set('n', '<leader>s', ':e ~/.config/nvim/init.lua<CR>')
vim.keymap.set('n', '<leader>|', ':w<CR>')
vim.keymap.set('n', '<C-k>', ':FzfLua files<CR>')
vim.keymap.set('n', '<C-l>', ':FzfLua buffers<CR>')
vim.keymap.set('n', '<M-l>', ':FzfLua lines<CR>')
require("nvim-autopairs").setup {}
local modus = {'n', 'i', 'v', 'x', 's', 'o', 't', 'l'}
vim.keymap.set(modus, '<Right>', ':w<CR>')
vim.keymap.set(modus, '<Left>', ':term<CR>')
vim.keymap.set(modus, '<Up>', ':FzfLua files<CR>')
vim.keymap.set(modus, '<Down>', ':Lex<CR>')

--
-- #4 Colourschemes
vim.keymap.set('n', '<F8>', ':colorscheme zaibatsu<CR>')
vim.keymap.set('n', '<F9>', ':colorscheme nordic<CR>')
vim.cmd([[ colorscheme zaibatsu ]])


-- #5 LSP, formating, treesitter and more
-- *3 lsp keybinds
vim.keymap.set('n', '<leader>w', '<cmd>lua vim.diagnostic.open_float()<CR>')
vim.keymap.set('n', '<leader>e', '<cmd>lua vim.diagnostic.enable(not vim.diagnostic.is_enabled())<CR>')
vim.keymap.set('n', '<leader>v', '<cmd>lua vim.diagnostic.goto_next()<CR>')
vim.keymap.set('n', '<leader>b', '<cmd>lua vim.diagnostic.goto_prev()<CR>')

vim.keymap.set('n', '<leader>a', function()
  local new_config = not vim.diagnostic.config().virtual_text
  vim.diagnostic.config({ virtual_text = new_config })
end, { desc = 'Toggle diagnostic virtual_text' })

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '',
      [vim.diagnostic.severity.WARN] = '',
    },
    linehl = {
      [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
    },
    numhl = {
      [vim.diagnostic.severity.WARN] = 'WarningMsg',
    },
  },
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end,
})

vim.cmd("set completeopt+=noselect")
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
vim.lsp.enable({ 'lua_ls', 'bashls', 'nixd' })

require 'nvim-treesitter.configs'.setup {
  highlight = { enable = true },
  indent = { enable = true },
  incremental_selection = { enable = true }
}

-- *4 indent
vim.keymap.set('n', '<leader>q',
  ':let save_cursor = getpos(".")<CR> :execute "normal! G" | execute "normal! V" | execute "normal! gg" | execute "normal! ="<CR> :call setpos(".", save_cursor)<CR>',
  { noremap = true, silent = true })


-- #6 Apparance
-- *5 lines
local bufferline = require('bufferline')
bufferline.setup({
  options = {
    style_preset = bufferline.style_preset.no_italic,
  }
})

-- *6 Dashboard
vim.keymap.set('n', '<leader>f', ':Dashboard<CR>')
require('dashboard').setup { -- clone the git reposetory into .local share etc nvim myplugins and a directory
  config = {
    header = {
      "NixOS BTW",
      " ",
    },
    shortcut = {
      {
        icon = ':3 ',
        desc = 'Files ',
        group = 'Label',
        action = 'FzfLua files',
        key = 'f',
      },

      {
        desc = 'Quit ',
        group = 'Label',
        action = 'q',
        key = 'q',
      },
    },
    footer = {
      " ",
      "Tinkpadx200 BTW",
    }
  }
}
