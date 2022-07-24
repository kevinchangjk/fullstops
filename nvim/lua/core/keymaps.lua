-- sets leader as the space key
vim.g.mapleader = " "

-- function to build noremap functions
local noremap = function(mode)
	return function(lhs, rhs, verbose)
		if type(rhs) == "string" then
			vim.api.nvim_set_keymap(mode, lhs, rhs, {
				noremap = true,
				silent = not (verbose or false),
			})
		else
			vim.api.nvim_set_keymap(mode, lhs, "", {
				noremap = true,
				silent = not (verbose or false),
				callback = rhs,
			})
		end
	end
end

local anoremap = noremap("")
local nnoremap = noremap("n")
local vnoremap = noremap("v")

-- no-ops
nnoremap("<space>", "")
nnoremap("<bs>", "")
nnoremap("<left>", "")
nnoremap("<right>", "")
nnoremap("<up>", "")
nnoremap("<down>", "")

-- on-the-go reload vimrc
nnoremap("<leader><cr>", ":so $MYVIMRC<cr>")

-- remap H and L for nav
anoremap("H", "^")
anoremap("J", "G")
anoremap("K", "gg")
anoremap("L", "$")

-- remap for joining lines
nnoremap("G", ":join<cr>")
nnoremap("gg", ":join!<cr>")
vnoremap("G", ":join<cr>")
vnoremap("gg", ":join!<cr>")

-- yank to clipboard
nnoremap("<leader>y", '"+y')
vnoremap("<leader>y", '"+y')

-- split jumping
nnoremap("<c-h>", ":wincmd h<cr>")
nnoremap("<c-j>", ":wincmd j<cr>")
nnoremap("<c-k>", ":wincmd k<cr>")
nnoremap("<c-l>", ":wincmd l<cr>")
nnoremap("<c-g>", ":wincmd =<cr>")

-- jump to parent enclosing parantheses
nnoremap("[[", ":call searchpair('\\[', '', '\\]', 'b')<cr>")
nnoremap("]]", ":call searchpair('\\[', '', '\\]')<cr>")
