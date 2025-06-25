local cmp_lsp = require("cmp_nvim_lsp")
local capabilities = vim.tbl_deep_extend(
    "force",
    {},
    vim.lsp.protocol.make_client_capabilities(),
    cmp_lsp.default_capabilities()
)
require('mason').setup()
require('mason-lspconfig').setup({
    handlers = {
        function(server_name)
            require("lspconfig")[server_name].setup {
                capabilities = capabilities
            }   
        end,
    }
})
