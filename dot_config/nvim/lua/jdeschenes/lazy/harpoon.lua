return {
    'ThePrimeagen/harpoon',
    branch = "harpoon2",
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope.nvim',
    },
    config = function()
        local harpoon = require('harpoon')
        harpoon:setup()

        vim.keymap.set("n", "<leader>a", function()
            harpoon:list():add()
        end)

        vim.keymap.set("n", "<C-e>", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end)

        vim.keymap.set("n", "<F1>", function()
            harpoon:list():select(1)
        end)
        vim.keymap.set("n", "<leader><F1>", function()
            harpoon:list():replace_at(1)
        end)

        vim.keymap.set("n", "<F2>", function()
            harpoon:list():select(2)
        end)
        vim.keymap.set("n", "<leader><F2>", function()
            harpoon:list():replace_at(2)
        end)

        vim.keymap.set("n", "<F3>", function()
            harpoon:list():select(3)
        end)
        vim.keymap.set("n", "<leader><F3>", function()
            harpoon:list():replace_at(3)
        end)

        vim.keymap.set("n", "<F4>", function()
            harpoon:list():select(4)
        end)
        vim.keymap.set("n", "<leader><F4>", function()
            harpoon:list():replace_at(4)
        end)

        vim.keymap.set("n", "<F5>", function()
            harpoon:list():select(5)
        end)
        vim.keymap.set("n", "<leader><F5>", function()
            harpoon:list():replace_at(5)
        end)
    end,
}
