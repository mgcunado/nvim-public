local home = '/home/mikel/.config/nvim'
local cmd = vim.api.nvim_create_autocmd
local map = vim.keymap.set

return {
	-- lilypond
	{
		"martineausimon/nvim-lilypond-suite",
    dependencies = {
      { "MunifTanjim/nui.nvim" },
    },
		ft = { "ly", "lilypond" },
		config = function()
		      require('nvls').setup({
        lilypond = {
          mappings = {
            player = "<leader>m",
            -- player = "<F3>",
            -- compile = "<leader>c",
            compile = "<F5>",
            open_pdf = "<F6>",
            switch_buffers = "<A-Space>",
            -- insert_version = "<F4>",
            insert_version = "<leader>v",
            hyphenation = "<F12>",
            hyphenation_change_lang = "<F11>",
            insert_hyphen = "<leader>ih",
            add_hyphen = "<leader>ah",
            del_next_hyphen = "<leader>dh",
            del_prev_hyphen = "<leader>dH",
            del_selected_hyphen = "<leader>dh"
          },
          options = {
            pitches_language = "default",
            output = "pdf",
            main_file = "main.ly",
            main_folder = "%:p:h",
            include_dir = "$HOME",
            hyphenation_language = "en_DEFAULT"
          },
          highlights = {
            lilyString = { link = "String" },
            lilyDynamic = { bold = true },
            lilyComment = { link = "Comment" },
            lilyNumber = { link = "Number" },
            lilyVar = { link = "Tag" },
            lilyBoolean = { link = "Boolean" },
            lilySpecial = { bold = true },
            lilyArgument = { link = "Type" },
            lilyScheme = { link = "Special" },
            lilyLyrics = { link = "Special" },
            lilyMarkup = { bold = true },
            lilyFunction = { link = "Statement" },
            lilyArticulation = { link = "PreProc" },
            lilyContext = { link = "Type" },
            lilyGrob = { link = "Include" },
            lilyTranslator = { link = "Type" },
            lilyPitch = { link = "Function" },
            lilyChord = {
              ctermfg = "lightMagenta",
              fg = "lightMagenta",
              bold = true
            },
          },
        },
        latex = {
          mappings = {
            compile = "<F5>",
            open_pdf = "<F6>",
            lilypond_syntax = "<F3>"
          },
          options = {
            clean_logs = false
          },
        },
        player = {
          mappings = {
            quit = "q",
            play_pause = "p",
            loop = "<A-l>",
            backward = "h",
            small_backward = "<S-h>",
            forward = "l",
            small_forward = "<S-l>",
            decrease_speed = "j",
            increase_speed = "k",
            halve_speed = "<S-j>",
            double_speed = "<S-k>"
          },
          options = {
            row = "2%",
            col = "99%",
            width = "37",
            height = "1",
            border_style = "single",
            winhighlight = "Normal:Normal,FloatBorder:Normal",
            mpv_flags = {
              "--msg-level=cplayer=no,ffmpeg=no",
              "--loop",
              "--config-dir=/dev/null"
            }
          },
        },
      })

      -- to work it we must write upper voice's elements separated by space and then lower voice elements, alwais separated by spaces
      map("x", "<leader>y", ':s/ *\\(.*\\) \\(.*\\) \\(.*\\) \\(.*\\) \\(.*\\) \\(.*\\) \\(.*\\) \\(.*\\)/<\\1 \\5> <\\2 \\6> <\\3 \\7> <\\4 \\8>/<CR><Esc>v=')
      map("x", "<leader>yy", ':s/ *\\(.*\\) \\(.*\\) \\(.*\\) \\(.*\\)/<\\1 \\3> <\\2 \\4>/<CR><Esc>v=')
      map("x", "<leader>yyy", ':s/ *\\(.*\\) \\(.*\\) \\(.*\\) \\(.*\\) \\(.*\\) \\(.*\\)/<\\1 \\4> <\\2 \\5> <\\3 \\6>/<CR><Esc>v=')

      -- access some lilypond related dirs
      cmd({"BufEnter", "BufWinEnter", "BufNewFile"}, {
        pattern = {"*.ly"},
        command = "source " .. home .. "/abbreviations/lilypond.vim",
      })

      -- personal functions
			vim.cmd([[
      " lilypond compile and open pdf file
      function! CompileAndOpenLilypondPdf(...)
      silent exec "normal \<F5>"
      silent sleep 6
      silent exec "normal \<F6>"
      endfunction
      :command! CompileAndOpenLilypondPdf :call CompileAndOpenLilypondPdf()
      nnoremap <leader>ccc :CompileAndOpenLilypondPdf<CR>

      function! SaveAndCompileLilypondFile(...)
      silent exec "normal \<F2>"
      silent sleep 3
      silent exec "normal \<F5>"
      endfunction
      :command! SaveAndCompileLilypondFile :call ConvertSharpsAndFlats() | call SaveAndCompileLilypondFile()
      " :command! SaveAndCompileLilypondFile :call SaveAndCompileLilypondFile()
      nnoremap <leader>c :SaveAndCompileLilypondFile<CR><C-o><C-o><C-o>
      inoremap <C-l> <Esc>:SaveAndCompileLilypondFile<CR>li

      " convert repeated characters into sharps and flats
      function! ConvertSharpsAndFlats(...)
      silent! %s/\([a-g]\)\1\1\1\1/\1eses/
      silent! %s/\([a-g]\)\1\1\1/\1isis/
      silent! %s/\([a-g]\)\1\1/\1es/
      silent! %s/ees/xxxxxxxxx/
      silent! %s/\([a-g]\)\1/\1is/
      silent! %s/xxxxxxxxx/ees/
      silent! %s/tafis/taff/
      silent! %s/ofisset/offset/
      silent! %s/padising/padding/
      silent! %s/acisepts/accepts/
      silent! %s/CueisndClef/CueEndClef/
      silent! %s/Acisidental/Accidental/
      silent! %s/\\fis/\\ff/
      endfunction
      :command! ConvertSharpsAndFlats :call ConvertSharpsAndFlats()
      nnoremap <leader>h :ConvertSharpsAndFlats<CR>
	     ]])
		end,
	},
  {
    "MunifTanjim/nui.nvim",
		ft = { "ly" },
  },
}
