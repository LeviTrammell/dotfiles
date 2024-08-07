-- return {
--   "jose-elias-alvarez/null-ls.nvim",
--   dependencies = { 'nvim-lua/plenary.nvim' },
--   config = function()
--     local null_ls = require('null-ls')
--     null_ls.setup({
--       sources = {
--         null_ls.builtins.formatting.stylua,
--         null_ls.builtins.diagnostics.eslint,
--         null_ls.builtins.completion.spell,
--         null_ls.builtins.diagnostics.terraform_validate,
--         null_ls.builtins.formatting.terraform_fmt,
--         null_ls.builtins.formatting.rustfmt,
--       },
--       on_attach = function(client, bufnr)
--         -- Enable formatting on sync
--         if client.supports_method("textDocument/formatting") then
--           local format_on_save = vim.api.nvim_create_augroup("LspFormatting", { clear = true })
--           vim.api.nvim_create_autocmd('BufWritePre', {
--             group = format_on_save,
--             buffer = bufnr,
--             callback = function()
--               vim.lsp.buf.format({
--                 bufnr = bufnr,
--                 filter = function(_client)
--                   return _client.name == "null-ls"
--                 end
--               })
--             end,
--           })
--         end
--       end,
--     })
--   end
-- }

return {
  "jay-babu/mason-null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "jose-elias-alvarez/null-ls.nvim",
  },
  config = function()
    require("mason-null-ls").setup({
      ensure_installed = {
        -- Opt to list sources here, when available in mason.
      },
      automatic_installation = false,
      handlers = {},
    })
  end,
}
