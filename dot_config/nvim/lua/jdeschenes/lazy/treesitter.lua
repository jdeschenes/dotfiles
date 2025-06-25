return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({

                ensure_installed = { 
                    "vimdoc", "javascript", "typescript", "python", "c", "lua", "rust",
                    "bash", "go",
                },

                -- Install parser synchronously (only applied to `ensure_installed`)
                sync_install = false,

                -- Automatically install missing parsers when entering buffer
                -- Recommendation: set to false if you have have `tree-sitter` CLI installed locally
                auto_install = true,

                indent = {
                    enable = true
                },

                highlight = {
                    -- `false` will disable the whole extension
                    enable = true,

                    -- Setting this to true will run `:h syntax` and tree-sitter at the same time
                    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                    -- Using this option may slow down your editor, and you may see some duplicate highlights.
                    -- Instead of true it can also be a list of languages.
                    additional_vim_regrex_highlighting = { "markdown" },
                },
            })
        end
    },

    {
        "nvim-treesitter/nvim-treesitter-context",
        after = "nvim-treesitter",
        config = function()
            require("treesitter-context").setup({
                -- Enable this plugin (Can be enabled/disabled later via commands)
                enable = true,
                -- Enable multiwindow support.
                multiwindow = false,
                -- How many lines the window should span. Values <= 0 mean no limit.
                max_lines = 0,
                -- Minimum editor window height to enable context. Values <= 0 mean no limit.
                min_window_height = 0,
                line_numbers = true,
                -- Maximum number of lines to show for a single context
                multiline_threshold = 20,
                -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
                trim_scope = 'outer',
                -- Line used to calculate context. Choices: 'cursor', 'topline'
                mode = 'cursor',
                -- Separator between context and content. Should be a single character string, like '-'.
                -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
                separator = nil,
                -- The Z-index of the context window
                zindex = 20,
                on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
            })
        end
    },
}
