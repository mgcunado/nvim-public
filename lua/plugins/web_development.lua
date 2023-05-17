return {
  -- emmet
  {
    "mattn/emmet-vim",
    ft = { "html", "javascript", "php", "blade", "jsx", "tsx", "vue", "css", "scss" },
    config = function()
      vim.keymap.set("i", ",,", "<plug>(emmet-expand-abbr)", { remap = true })
    end,
  },

  -- prettify
  {
    "prettier/vim-prettier",
    ft = { "html", "php", "blade", "jsx", "vue", "css", "scss", "typescript", "json", "markdown", "yaml" },
    cmd = { "Prettier", "PrettierAsync" },
    build = "npm install",
  },

  -- Css Color
  {
    "norcalli/nvim-colorizer.lua",
    ft = { "css", "scss" },
    config = function()
      require 'colorizer'.setup {
        'css';
        'javascript';
        html = {
          mode = 'foreground';
        }
      }
      DEFAULT_OPTIONS = {
        RGB      = true;         -- #RGB hex codes
        RRGGBB   = true;         -- #RRGGBB hex codes
        names    = true;         -- "Name" codes like Blue
        RRGGBBAA = false;        -- #RRGGBBAA hex codes
        rgb_fn   = false;        -- CSS rgb() and rgba() functions
        hsl_fn   = false;        -- CSS hsl() and hsla() functions
        css      = false;        -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn   = false;        -- Enable all CSS *functions*: rgb_fn, hsl_fn
        -- Available modes: foreground, background
        mode     = 'background'; -- Set the display mode.
      }
    end,
  },
}
