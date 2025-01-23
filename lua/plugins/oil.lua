vim.api.nvim_set_keymap('n', '<leader>md', ':lua CreateDirectory()<CR>', { noremap = true, silent = true })

function CreateDirectory()
  local dir_name = vim.fn.input("Enter directory name: ")
  if dir_name ~= "" then
    vim.fn.mkdir(dir_name, "p")
    print("Directory created: " .. dir_name)
    vim.cmd("e") -- Refresh the oil.nvim buffer
  else
    print("No directory name provided.")
  end
end

return {
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  }
}
