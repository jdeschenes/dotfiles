return {
    {
        "folke/trouble.nvim",
        dependencies = {
            'kyazdani42/nvim-web-devicons',
        },
        config = function()
            local trouble = require("trouble")
            trouble.setup({
                modes = {
                    cascade = {
                        mode = "diagnostics",
                        filter = function(items)
                            local  severity = vim.diagnostic.severity.HINT
                            for _, item in ipairs(items) do
                                severity = math.min(severity, item.severity)
                            end
                            return vim.tbl_filter(function(item)
                                return item.severity == severity
                            end, items)
                        end
                    },
                }
            })

            vim.keymap.set("n", "<leader>tt", function()
                trouble.toggle({ mode = 'cascade' })
            end)
            vim.keymap.set("n", "[t", function()
                trouble.next({skip_groups = true, jump = true});
            end)
            vim.keymap.set("n", "]t", function()
                trouble.previous({skip_groups = true, jump = true});
            end)

        end
    },
}
