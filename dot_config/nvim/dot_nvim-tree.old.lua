local function open_nvim_tree(data)

  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  if not directory then
    return
  end

  -- change to the directory
  vim.cmd.cd(data.file)

  -- open the tree
  require("nvim-tree.api").tree.toggle({ focus = false, find_file = true })
end

return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      create_in_closed_folder = true,
      hijack_cursor = true,
      focus_empty_on_setup = true,
      sync_root_with_cwd = true,
      update_focused_file = { enable = true },
      view = {
      	adaptive_size = false,
      	preserve_window_proportions = true,
      },
    })
    
    vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
    
    -- Automatically open file upon creation
    local api = require("nvim-tree.api")
    api.events.subscribe(api.events.Event.FileCreated, function(file)
      vim.cmd("edit " .. file.fname)
    end)
  end,
}
