function ColorMyPencils(color)
    color = color or 'kanagawa'
    require('kanagawa').setup({
        transparent = false,
        dimInactive = true,
        theme = "wave",
        background = {
            dark = "wave",
            light = "lotus",
        },
    })

    vim.cmd.colorscheme(color)
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()
