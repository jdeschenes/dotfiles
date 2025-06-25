require("jdeschenes.set")
require("jdeschenes.remap")
require('jdeschenes.lazy_init')

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local yank_group = augroup('HighlightYank', {})
local jdeschenes_group = augroup('jdeschenes', {})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function ()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 100,
        })
    end
})

autocmd('LspAttach', {
    group = jdeschenes_group,
    callback = function(e)
        local opts = { buffer = e.buf }
        -- Get a hover of the definition
        vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set('n', 'grd', function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set('n', 'gra', function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set('n', 'grr', function() vim.lsp.buf.references() end, opts)
        vim.keymap.set('n', 'grn', function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set('i', "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    end
})

-- Reuse the same window (default)
vim.g.netrw_browse_split = 0
-- Remove the annoying banner when navigating files
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
