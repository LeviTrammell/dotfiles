vim.g.mapleader = " "

vim.wo.number = true
vim.wo.fillchars = "eob: "

vim.opt.termguicolors = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true

require("lazy-nvim")
require("after/plugin/keymaps")

require("mason").setup()
require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers({
  function(server_name) -- default handler (optional)
    require("lspconfig")[server_name].setup({})
  end,
})

require("alpha").setup(require("alpha.themes.dashboard").config)

function CurrentBufferFilePath()
  local current_buf = vim.api.nvim_get_current_buf()
  local file = vim.api.nvim_buf_get_name(current_buf)

  if file == "" then
    return nil
  end

  return file
end

function CopyCurrentBufferDirectory()
  local file_path = CurrentBufferFilePath()

  if file_path == nil then
    return
  end

  local directory = vim.fn.fnamemodify(file_path, ":p:h")

  os.execute("echo " .. directory .. " | pbcopy")

  print("Directory '" .. directory .. "' copied to clipboard.")
end

vim.api.nvim_create_user_command("CopyCurrentBufferDir", CopyCurrentBufferDirectory, {})
