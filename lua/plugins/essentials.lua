local map = vim.keymap.set
return {

  -- Automatically create any non-existent directories before writing the buffer.
  "pbrisbin/vim-mkdir",

  -- Useful commands like :Delete
  "tpope/vim-eunuch",

  -- .editorconfig compatibilty
  "editorconfig/editorconfig-vim",

  -- comment
  { "numToStr/Comment.nvim", config = true },

  -- surround with ys
  "tpope/vim-surround",

  -- show markers
  "chentoast/marks.nvim",

  -- auto pairs
  { "windwp/nvim-autopairs", config = true },

  -- fix things directly in quickfix list
  "stefandtw/quickfix-reflector.vim",

  -- Search with ripgrep :Rg
  {
    "jremmen/vim-ripgrep",
    cmd = { "Rg", "RgRoot" },
    config = function()
      vim.g.rg_command = 'rg --vimgrep --pcre2 --type-add="scss:*.scss"'
    end,
  },

  -- zoom in / out
  {
    "nyngwang/NeoZoom.lua",
    cmd = { "NeoZoomToggle" },
    config = function()
      require("neo-zoom").setup({
        width_ratio = 1,
        height_ratio = 1,
      })
      map("n", "<leader>z", ":NeoZoomToggle<cr>")
    end,
  },

  -- align things, example: Tabularize /,
  {
    "godlygeek/tabular",
    cmd = { "Tabularize" },
  },

  -- calculate
  {
    "sk1418/HowMuch",
    config = function()
      vim.g.HowMuch_scale = 8
      map("n", "<leader>hm", "V<Plug>AutoCalcAppendWithEq")
      map("x", "<leader>hm", "<Plug>AutoCalcAppendWithEq")
      map("x", "<leader>hms", "<Plug>AutoCalcAppendWithEqAndSum")
      map("x", "<leader>hmr", "<Plug>AutoCalcReplace")
    end,
  },

  -- wrap/unwrap word, sentence, paragraph with quotes, parentheses, etc
  "machakann/vim-sandwich",

  -- is a modern multi cursor for neovim
  "mg979/vim-visual-multi",

  -- substitution: all the combination for singular, plural, capitalize, upper and lower cases.
  "tpope/vim-abolish",

  -- to:move around the file. (dont work at this moment in neovim)

-- usage (see :help easymotion):
-- <Leader><Leader>f => find 1 char and select to move over it
-- <Leader><Leader>s => find 2 chars and select to move over them
-- <Leader><Leader>w => find 1 word and select to move over it
-- <Leader><Leader>L => move to at the begining of a line
  "easymotion/vim-easymotion",
}
