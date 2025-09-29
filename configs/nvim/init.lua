-- #1 Plugins
vim.pack.add({
  { src = "https://github.com/ibhagwan/fzf-lua" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/windwp/nvim-autopairs" },

  { src = "https://github.com/hrsh7th/nvim-cmp" },
  { src = "https://github.com/hrsh7th/cmp-nvim-lsp" },

  -- { src = "https://github.com/chentoast/marks.nvim" },
  -- { src = "https://github.com/Krak9n/mary.nvim" },

  -- { src ="" },
})

-- #2 Options
vim.keymap.set('n', '<M-p>', ':!rm -r ~/.local/share/nvim<CR> ')
vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.tabstop = 2
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.g.mapleader = " "
vim.o.cursorline = true
vim.o.scrolloff = 8
vim.o.sidescrolloff = 6
vim.g.netrw_banner = false
vim.g.netrw_liststyle = 3
vim.g.netrw_preview = 1
vim.o.winborder = "rounded"
vim.o.autocomplete = true
vim.g.autoformat = true
vim.o.wildmode = "longest:full,full"
vim.o.colorcolumn = "120"
vim.o.confirm = true
vim.o.autowrite = true
vim.o.list = true
vim.cmd([[
set listchars=trail:-
set listchars=tab:>-
set listchars=nbsp:+
set listchars=extends:>
set listchars=eol:$
set listchars=precedes:<
]])


-- *2 undo and micelanious options
vim.cmd([[ set undodir=~/.vim/undo-di ]])
vim.cmd([[ set undofile ]])
vim.cmd([[ tnoremap <M-Esc> <C-\><C-n> ]])
vim.cmd([[ highlight DiagnosticError guifg=BrightRed ]])
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("yank-highlight", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
-- require('mary').setup()

-- #3 Naviagtion
vim.keymap.set('n', '<C-n>', ':bn <CR>')
vim.keymap.set('n', '<C-Right>', ':bn <CR>')
vim.keymap.set('n', '<C-Left>', ':bp <CR>')
vim.keymap.set('n', '<C-c>', ':bdelete <CR>')
vim.keymap.set('n', '<M-c>', ':bdelete! <CR>')
vim.keymap.set('n', '<F2>', ':terminal <CR>')
vim.keymap.set('n', '<leader>s', ':e ~/.config/nvim/init.lua<CR>')
vim.keymap.set('n', '<leader>|', ':w<CR>')
vim.keymap.set('n', '<leader>1', ':q<CR>')
vim.keymap.set('n', '<C-k>', ':FzfLua files<CR>')
vim.keymap.set('n', '<C-l>', ':FzfLua buffers<CR>')
vim.keymap.set('n', '<M-l>', ':FzfLua lines<CR>')
require("nvim-autopairs").setup {}
-- require("marks").setup()
local modus = {'n', 'i', 'v', 'x', 's', 'o', 'l'}
vim.keymap.set(modus, '<Right>', ':w<CR>')
vim.keymap.set(modus, '<Left>', ':q<CR>')
vim.keymap.set(modus, '<Up>', ':FzfLua files<CR>')
vim.keymap.set(modus, '<Down>', ':Lex<CR>')
vim.keymap.set(modus, '<M-y>', '"*y')
vim.keymap.set(modus, '<M-0>', ':set cursorcolumn<CR> ')


-- #4 Colourschemes
vim.keymap.set('n', '<F8>', ':colorscheme zaibatsu<CR> <cmd>hi Visual guifg=magenta<CR>')
vim.cmd([[ colorscheme zaibatsu ]])
vim.cmd [[
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight LineNr ctermfg=cyan
highlight NormalFloat ctermbg=none
highlight Visual ctermfg=magenta
highlight Visual ctermbg=black
highlight WarningMsg ctermfg=magenta
highlight ErrorMsg ctermfg=red
highlight String ctermfg=white
highlight shQuote ctermfg=white

highlight Normal guibg=none
highlight NonText guibg=none
highlight LineNr guifg=cyan
highlight NormalFloat guibg=none
highlight Visual guifg=magenta
highlight Visual guibg=black
highlight WarningMsg guifg=magenta
highlight ErrorMsg guifg=red
highlight String guifg=white
highlight shQuote guifg=white
]]


-- #5 LSP, formating, treesitter and more
-- *3 lsp keybinds
vim.keymap.set('n', '<leader>q', "mqG=gg'q")
vim.keymap.set('n', '<leader>w', '<cmd>lua vim.diagnostic.open_float()<CR>')
vim.keymap.set('n', '<leader>e', '<cmd>lua vim.diagnostic.enable(not vim.diagnostic.is_enabled())<CR>')
vim.keymap.set('n', '<leader>v', '<cmd>lua vim.diagnostic.goto_next()<CR>')
vim.keymap.set('n', '<leader>b', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
vim.keymap.set('n', '<leader>r', '<cmd>FzfLua lsp_workspace_diagnostics<CR>')
vim.keymap.set('n', '<leader>f', '<cmd>FzfLua lsp_document_diagnostics<CR>')
vim.keymap.set('n', '<leader>d', '<cmd>FzfLua registers<CR>')
vim.diagnostic.config({
  signs = true,
  update_in_insert = true,
})

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
      [vim.diagnostic.severity.HINT] = 'HintMsg',
      [vim.diagnostic.severity.INFO] = 'InfoMsg',
    },
  },
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = false })
    end
  end,
})
local cmp = require('cmp')
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
  }),
  completion = {
    completeopt = 'menu,menuone,noinsert,select',
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
  }),
})

vim.lsp.enable({ 'lua_ls', 'bashls', 'rust_analyzer', 'nil_ls', 'marksman' })
require 'nvim-treesitter.configs'.setup {
  highlight = { enable = true },
  indent = { enable = true },
  incremental_selection = { enable = true }
}

-- #6 Apparance
vim.cmd([[
set cmdheight=1
]])
