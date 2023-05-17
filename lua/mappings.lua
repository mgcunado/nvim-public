local map = vim.keymap.set
-- local home = '/home/mikel/.config/nvim'
-- local cmd = vim.api.nvim_create_autocmd

-----------
-- Movement
-----------

-- Lines
map("n", "<C-l>", "g_")
map("x", "<C-l>", "g_")
map("n", "<C-h>", "^")
map("x", "<C-h>", "^")

-- Buffers
map("n", "<C-j>", ":bn<CR>")
map("n", "<C-k>", ":bp<CR>")

-- Alternate buffer
map("n", "<leader>k", ":b#<CR>")

-- Tabs
map("n", "<leader>tt", ":tabnew<CR>")
map("n", "<leader>tc", ":tabclose<CR>")
map("n", ")", ":tabnext<CR>")
map("n", "(", ":tabprevious<CR>")

-- Move tabs
map("n", "<leader>)", ":tabm +1<cr>")
map("n", "<leader>(", ":tabm -1<cr>")

-- Go to end of page and center
map("n", "G", "Gzz")

-- Add movement to jumplist when using relative numbers
map("n", "k", '(v:count > 2 ? "m\'" . v:count : "") . "k"', { expr = true })
map("n", "j", '(v:count > 2 ? "m\'" . v:count : "") . "j"', { expr = true })

-- Scroll viewport faster: >
map("n", "<C-e>", "2<C-e>")
map("n", "<C-y>", "2<C-y>")

----------
-- Buffers
----------

-- close buffer
map("n", "<leader>q", ":bd<CR>")

-- close unsaved buffer, no save
map("n", "<leader>Q", ":bd!<CR>")

-- just die please
map("n", "<localleader>q", ":qa!<CR>")

-- write
-- map("n", "<leader>w", ":w!<CR>")

-- close all buffers
map("n", "<leader>bd", ":%bd<CR>")

-- close other splits, keep current only
map("n", "<leader>o", ":only<CR>")

---------
-- Splits
---------

map("n", "<leader><up>", ":resize -10<CR>")
map("n", "<leader><down>", ":resize +10<CR>")
map("n", "<leader><left>", ":vertical resize -10<CR>")
map("n", "<leader><right>", ":vertical resize +10<CR>")

-------------------
-- Visual Shortcuts
-------------------

-- Visual line
map("n", "<leader>l", "_vg_")

-- Visual document
map("n", "<leader>a", "ggVG")

-- Move lines in visual mode
map("x", "<c-a>", ":m '>+1<CR>gv=gv")
map("x", "<c-p>", ":m '<-2<CR>gv=gv")

-- J K just move
map("x", "J", "j")
map("x", "K", "k")

-- sort selection
map("x", "<leader>s", ":sort<CR>")

------------
-- Quick fix
------------

map("n", "[c", ":cprevious<cr>")
map("n", "]c", ":cnext<cr>")
map("n", "<leader>co", ":copen<CR>")
map("n", "<leader>cc", ":cclose<CR>")

--------
-- Macros
--------

-- Execute macro q on visual selection
map("x", "Q", ":normal Q<CR>", { remap = true })

-----------------------
-- Clipboard / registers
-----------------------

-- Copy text to the end of line, behave like C D
map("n", "Y", "y$")

-- Fix issues when pasting a lot of code
map("n", "F2", ":set pastetoggle<CR>")

-- Don't lose clipboard when pasting
map("x", "p", "pgvy")

----------------
-- Search replace
----------------

-- Clear search
map("n", "<leader><Esc>", ":let @/=''<cr>", { silent = true })

-- No highlight search
map("n", "<leader>/", ":nohlsearch<cr>")

-- Makes * and # work on visual mode too.
vim.cmd([[
function! s:VSetSearch(cmdtype)
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
  let @s = temp
endfunction

xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR>
]])

-- don't move cursor on * #
map("n", "*", "*N")
map("n", "#", "#N")

-- <leader>r replace, repeat with .
map("n", "<leader>r", "*Ncgn")
map("x", "<leader>r", "*Ncgn", { remap = true }) -- first execute VSetSearch

-- <leader>R replace all
map("n", "<leader>R", 'yiw:%s/\\V<C-r>"/<C-r>"')
map("x", "<leader>R", 'y:%s/\\V<C-r>"/<C-r>"')

-----------------------------------
-- Appereance / GUI
-----------------------------------

-- wrap/unwrap long text
map("n", "<leader>gw", ":set wrap<CR>")
map("n", "<leader>gW", ":set wrap!<CR>")

-- Refresh
map("n", "<F5>", ":e<CR>")

-------------------------
-- Command line mappings
-------------------------

-- Expand to current file path in command line
map("c", "<localleader>%", '<C-R>=fnameescape(expand("%:p"))<CR>')

-- Expand && to only file name (tail)
map("c", "<localleader>t", '<C-R>=fnameescape(expand("%:t"))<CR>')

-- Expand to current date
map("c", "<localleader>d", '<C-R>=strftime("%Y-%m-%d")<CR>')

-------------------------
-- Commands
-------------------------

-- Repeat last command
map("n", "g.", "@:")

---------------------------
-- Operator pending motions
---------------------------

-- yil to yank inside line
map("x", "il", "^og_")
map("o", "il", ":normal vil<CR>", { silent = true })

-------------------------
-- Formatting
-------------------------

-- Indent all document
-- map("n", "==", "gg=G")

-------------------------
-- My plugins
-------------------------

-- map("n", "<F12>", require("greport").greport)

-------------------------
-- markdown
-------------------------

map("n", "<leader>`", "S```<cr>```<esc>P")

-------------------------
-- Formatting
-------------------------

-- Indent all document
map("n", "==", "gg=G<C-o>")
-- HTML files Indent
map("n", "===", ":set filetype=html<CR>gg=G")
-- PHP file with HTML code
map("n", "p===", ":set filetype=html<CR>gg=G:set filetype=php<CR>")
-- set php filetype
map("n", "p==", ":set filetype=php<CR>")

-- Delete blank lines
-- clean double lines and spaces (functions in commands.vim)
map("n", "<leader>0", ":SpacesClean <CR>")

-------------------------
-- My plugins
-------------------------

-- map("n", "<F12>", require("greport").greport)

-----------------------------------
-- Utils
-----------------------------------

-- Insert date
map("n", "<localleader>h", 'i<c-r>=strftime("%Y-%m-%d")<CR><esc>')
map("i", "<localleader>h", '<c-r>=strftime("%Y-%m-%d")<CR>')

-- Underline
map("n", "<leader>-", '"zyy"zpVr-o<esc>')
map("n", "<leader>=", '"zyy"zpVr=o<esc>')

-- Append colon and semicolon
map("n", "<leader>,", 'A,<ESC>')
map("n", "<leader>;", 'A;<ESC>')

-- Open url under cursor
vim.cmd([[
function! OpenURLUnderCursor()
let s:uri = expand('<cWORD>')
let s:uri = substitute(s:uri, '?', '\\?', '')
let s:uri = shellescape(s:uri, 1)
if s:uri != ''
silent exec "!open '".s:uri."'"
:redraw!
endif
endfunction
]])
map("n", "gx", ':call OpenURLUnderCursor()<CR>')

-----------------------------------
-- lineas configuradas por mi
-----------------------------

map("n", "<leader>bn", ":e ")

-- Apertura de directorios de V7 en sporttia
map("n", "<leader>bnc", ":e src/controllers/v7/")
map("n", "<leader>bncc", ":e src/configs/constants.js<CR>")
map("n", "<leader>bnh", ":e src/services/v7/helpers/")
map("n", "<leader>bnm", ":e src/models/")
map("n", "<leader>bnr", ":e src/routes/v7/")
map("n", "<leader>bnrr", ":e src/repositories/v7/")
map("n", "<leader>bns", ":e src/services/v7/")
map("n", "<leader>bnss", ":e src/repositories/v7/scopes/")
map("n", "<leader>bnt", ":e tests/integration/")
map("n", "<leader>bnv", ":e src/validators/v7/")
map("n", "<leader>bnw", ":e src/swagger/docs/")
map("n", "<leader>bnww", ":e src/swagger/configs/")
map("n", "<leader>bnd", ":e ../doc/v7createapis<CR>")

-- Borrados globales
-- borrar los .only del archivo
map("n", "<leader>do", ":1,$s/\\.only//g<CR>")
-- write .only in a 'it(' test
map("n", "<leader>wo", "0f(i.only<ESC>")

-- Borrados unitarios
-- borrar lo que engloba entre paréntesis
map("n", "<leader>dpp", 'bvf(df)vd')

-- comentar una línea que se va a borrar después buscando por // ****
map("n", "<leader>gcc", '0ebi// ****<ESC>')
-- comentar, en modo visual las líneas seleccionadas para borrarlas después buscando por // ****
map("x", "<leader>gcc", ':norm I// ****<ESC>')

vim.cmd([[
" comentar n líneas que se van a borrar después buscando por // ****
function! s:commentnlines(lines)
execute "norm 0ebi// ****\e"
let c = 1
while c < a:lines
execute "norm bbji// ****\e"
let c += 1
endwhile
endfunction
:command! -nargs=* -bar Commentnlines :call s:commentnlines(<f-args>)
nnoremap <leader>gccr :Commentnlines

" descomentar n líneas que se van a recuperar buscando por // ****
function! s:descommentnlines(lines)
execute "norm 0ebv6ld"
let c = 1
while c < a:lines
execute "norm jv6ld"
let c += 1
endwhile
endfunction
:command! -nargs=* -bar Descommentnlines :call s:descommentnlines(<f-args>)
nnoremap <leader>dccr :Descommentnlines

" comment n lines in react js file
" using sai command in visual mode from machakann/vim-sandwich plugin
function! s:commentReactJs(lines=1)
execute "norm 0vg_sai{/* \<CR> */}\<CR>0"
let c = 1
while c < a:lines
execute "norm jvg_sai{/* \<CR> */}\<CR>0"
let c += 1
endwhile
endfunction
:command! -nargs=* -bar CommentReactJs :call s:commentReactJs(<f-args>)
nnoremap <leader>gccc :CommentReactJs

" uncomment n lines in react js file
function! s:descommentReactJs(lines=1)
execute "norm 0elv3hd$bhv3ld0"
" execute "norm 0v3ld$bhv3ld0"
let c = 1
while c < a:lines
execute "norm jelv3hd$bhv3ld0"
" execute "norm jv3ld$bhv3ld0"
let c += 1
endwhile
execute "norm =="
endfunction
:command! -nargs=* -bar DescommentReactJs :call s:descommentReactJs(<f-args>)
nnoremap <leader>dccc :DescommentReactJs
]])

map("n", "<F12>", ':q!<CR>')
map("i", "<F12>", '<ESC>:q!<CR>')
map("n", "<F2>", ':w!<CR>')
map("i", "<F2>", '<ESC>:w!<CR>i')
map("n", "<F4>", ':wq!<CR>')
map("i", "<F4>", '<ESC>:wq!<CR>')
-- map("n", "<F4>", ':set paste<CR>')
-- map("i", "<F4>", '<ESC>:set paste<CR>i')
map("n", "<F5>", ':set nopaste<CR>')
map("i", "<F5>", '<ESC>:set nopaste<CR>i')
-- map("n", "<F6>", ':set nu<CR>')
-- map("i", "<F6>", '<ESC>:set nu<CR>i')
-- map("n", "<F7>", ':set nu!<CR>')
-- map("i", "<F7>", '<ESC>:set nu!<CR>i')
map("n", "<F8>", ':vsp<CR>')
map("i", "<F8>", '<ESC>:vsp<CR>')
map("n", "<F9>", ':sp<CR>')
map("i", "<F9>", '<ESC>:sp<CR>')

-- In insert or command mode, move normally by using Ctrl
map("i", "<C-h>", '<Left>')
map("i", "<C-j>", '<Down>')
map("i", "<C-k>", '<Up>')
map("i", "<C-l>", '<Right>')
map("c", "<C-h>", '<Left>')
map("c", "<C-j>", '<Down>')
map("c", "<C-k>", '<Up>')
map("c", "<C-l>", '<Right>')

-- open a php new file
vim.cmd([[
autocmd BufNewFile *.php
\ exe "normal O<?php\r\r\<Del>" |
\ startinsert!

" uncomment next 3 lines in symfony projects
" autocmd BufNewFile /srv/http/*.php
" \ call Namespacewithsymfony() |
" \ startinsert!
]])

-- search with very magic mode on
map("n", "<leader>/", "/\\")
-- search with no magic
map("n", "<leader>?", "/\\M")

-- open relative paths under cursor with xdg-open (example: './my/relative/file.pdf')
-- nnoremap gF :silent :execute "!xdg-open" expand('%:p:h') . "/" . expand("<cfile>") " &"<cr>

-- open under cursor's file using relative path
-- in this case we can open a template file from a controller file in symfony project
map("n", "tgf", ":edit ../../templates/<cfile> <cr>")

-- set colorcolumn=100
-- highlight ColorColumn ctermbg=0 guibg=lightgrey

-------------------------
-- Copy lines
-------------------------

-- copy n lines below n lines
-- number of lines to copy
-- times to copy above number of lines
-- spacebetweentimes: we can insert one space line between blocks
vim.cmd([[
function! s:copynlines(number, times=1, spacebetweentimes=1)
let lines = a:number - 1
let c = 1
let toUp = (a:number) * (a:times)
while c <= a:times
execute "norm 0v" . lines . "jg_y" . lines . "jo"
if a:spacebetweentimes == 1
execute "norm 0o\e"
endif
execute "norm p"
let c += 1
endwhile
execute "norm 0" . lines . "jo\e" . toUp . "k" . (a:spacebetweentimes * a:times) . "kj"
endfunction
:command! -nargs=* -bar Copynlines :call s:copynlines(<f-args>) | :call DeleteTrailingWhiteSpace() | call DoubleSpacesRemove() | call DoubleBlankLinesRemove()

nnoremap <leader>1 :Copynlines

let s:measure = 0
function s:measureNumber()
  let s:measure += 1
  execute "norm i\ | % mes." . s:measure . "\e"
endfunction
:command! -bar MeasureNumber :call s:measureNumber()
nnoremap <leader>111 :MeasureNumber<CR>

function s:measureNumberAfterLast(lastMeasure)
  let s:measure += 1
  let measureNow = s:measure + a:lastMeasure
  execute "norm i\ | % mes." . measureNow . "\e"
  let s:measure = a:lastMeasure + 1
endfunction
:command! -nargs=* -bar MeasureNumberAfterLast :call s:measureNumberAfterLast(<f-args>)
nnoremap <leader>1111 :MeasureNumberAfterLast
]])

-- set foldmethod
map("n", "<leader>fi", ':set foldmethod=indent<CR>zR')
map("n", "<leader>fm", ':set foldmethod=manual<CR>')

-- to launch monokai filter (default is Pro)
-- map("n", "<leader>cm", ":MonokaiProSelect<CR>")
-- map("x", "<leader>cm", ":MonokaiProSelect<CR>")
-- mapeamos para lanzar el colorscheme molokai
-- map("n", "<leader>cm", ":colorscheme molokai<CR>")
-- map("x", "<leader>cm", ":colorscheme molokai<CR>")
-- mapeamos para lanzar el colorscheme dracula (disabled)
map("n", "<leader>cdd", ":colorscheme dracula<CR>")
map("x", "<leader>cdd", ":colorscheme dracula<CR>")

-- insert current file with and without extension
-- in insert mode
map("i", "<leader>fn", '<c-r>=expand("%:t")<CR>')
map("i", "<leader>fnn", '<c-r>=expand("%:t:r")<CR>')

vim.cmd([[
" All commits
command! Ghistory :Gclog

" Commits for current file
command! Ghistoryfile :0Gclog!
]])

-------------------------
-- Create new dir and new file
-------------------------

vim.cmd([[
" launch a curl request to send a file
" r!curl -s -F "file0=@/home/mikel/gato1.jpeg" http://localhost:3900/api/upload-image/6400a57d7501f0f1a85f81c3 | jq
function! s:launchCurlToUploadFile(fieldname, pathtofile, urlname)
silent exec "r!curl -s -F \"" . a:fieldname . "=@" . a:pathtofile . "\" " . a:urlname . " \| jq"
endfunction
:command! -nargs=* -bar LaunchCurlToUploadFile :call s:launchCurlToUploadFile(<f-args>)

nnoremap <leader>uu :LaunchCurlToUploadFile

function! s:createDirAndFile(dirname, filename)
silent exec "!mkdir -p " . a:dirname . "/"
silent exec "e " . a:dirname . "/" . a:filename
endfunction
:command! -nargs=* -bar CreateDirAndFile :call s:createDirAndFile(<f-args>)

nnoremap <leader>nn :CreateDirAndFile

" wrap selected text in visual mode by parenthesis
xnoremap <silent> <leader>mm <ESC>:let p = &paste<CR>:set paste<CR>:let a = line2byte(line('.')) + col('.')<CR>gvc()<ESC>:if getregtype() ==# 'V'<CR>call setreg('"', substitute(@", '\n$', '', ''), 'c')<CR>endif<CR>P:exe "goto ".a<CR>:exe "let &paste=".p<CR>
" wrap selected text in visual mode by square brackets
xnoremap <silent> <leader>mmm <ESC>:let p = &paste<CR>:set paste<CR>:let a = line2byte(line('.')) + col('.')<CR>gvc[]<ESC>:if getregtype() ==# 'V'<CR>call setreg('"', substitute(@", '\n$', '', ''), 'c')<CR>endif<CR>P:exe "goto ".a<CR>:exe "let &paste=".p<CR>
]])
