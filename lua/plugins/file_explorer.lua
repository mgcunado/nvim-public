return {
  -- file explorer
  {
    "kyazdani42/nvim-tree.lua",
    dependencies = {
      "kyazdani42/nvim-web-devicons", -- optional, for file icons
    },
    config = function()
      require("nvim-tree").setup({})

      local map = vim.keymap.set
      map("n", "<F7>", ":NvimTreeToggle<CR>")
      map("n", "<F6>", ":NvimTreeFindFile<CR>")
      -- map("n", "<leader>cd", ":cd %:p:h | NvimTreeOpen<cr>")

      -------------------------------
      -- Files manipulation, browsing
      -------------------------------

      -- map("n", "<leader>e", ":!open -R '%:p'<CR>")
      -- map("n", "<leader>E", ":!open .<CR>")
      -- map("n", "<F4>", ":Explore<CR>")

      -- Change dir to current file
      -- map("n", "<leader>cd", ":cd %:p:h<cr>")

    end,
  },
}
