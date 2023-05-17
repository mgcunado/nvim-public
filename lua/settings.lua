local ft = require('Comment.ft')

ft
 -- Set only line comment
 .set('yaml', '#%s')
-- uncomment next when using React with jsx file
 -- .set('javascript', '{/*%s*/}')
 -- Or set both line and block commentstring
 -- .set('javascript', {'//%s', '/*%s*/'})
-- uncomment next when using React with jsx file
 -- .set('javascript', {'{/*%s*/}', '{/*%s*/}'})

 .set('typescriptreact', '{/*%s*/}')
 .set('typescriptreact', {'//%s', '/*%s*/'})
 .set('typescriptreact', {'{/*%s*/}', '{/*%s*/}'})

 .set('http', {'#%s', '#%s#'})

-- get OPENAI_API_KEY() environment variable to launch ChatGPT
vim.env.OPENAI_API_KEY = os.getenv("OPENAI_API_KEY")

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.clipboard = "unnamedplus,unnamed" -- ALWAYS use the clipboard for ALL operations
vim.opt.expandtab = true -- Tabs are spaces, not tabs
vim.opt.ff = "unix" -- Use Unix as the standard file type
vim.opt.gdefault = true -- Add g (global) to substitute operations, :s/pattern/replacement/
vim.opt.history = 10000 -- Sets how many lines of history VIM has to remember
vim.opt.lazyredraw = true -- Don't redraw while executing macros (good performance config)
vim.opt.mouse = "a" -- Mouse support in all modes
vim.opt.number = true -- Line numbers on
vim.opt.relativenumber = true -- Use relative numbers instead of absolute
vim.opt.scrolloff = 5 -- Minimal number of screen lines to keep above and below the cursor.
vim.opt.shiftwidth = 2 -- Use indents of x spaces
vim.opt.showmatch = true -- Show matching brackets/parenthesis
vim.opt.signcolumn = "yes" -- Fixed space on the left for git and linting signs, otherwise it 'jumps'
vim.opt.smartindent = false -- Smart indent
vim.opt.ignorecase = true -- ignore casing on search
vim.opt.smartcase = true -- if search has uppercase, don't ignore case
vim.opt.softtabstop = 2 -- Number of spaces that a <Tab> counts for while performing editing
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.undofile = true -- saves undo history to an undo file, so it persists
vim.opt.virtualedit = "block" -- If you need to define a block in visual block mode with bounds outside the actual text (that is, past the end of lines), you can allow this with:
vim.opt.wrap = true -- Don't wrap long lines
vim.opt.formatoptions:remove("j") -- Don't delete comments when joining lines, this creates weird behaviour: https://github.com/neovim/neovim/issues/19729
vim.opt.redrawtime = 1000 -- After this milliseconds, stop processing syntax
