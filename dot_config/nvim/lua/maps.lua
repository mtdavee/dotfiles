local function nmapsl(pattern, action)
    local options = {noremap = true, silent = true}
    vim.api.nvim_set_keymap('n', '<leader>' .. pattern, action, options)
end

local function nmapl(pattern, action)
    local options = {noremap = true, silent = false}
    vim.api.nvim_set_keymap('n', '<leader>' .. pattern, action, options)
end

local function nmap(pattern, action)
    local options = {noremap = true, silent = false}
    vim.api.nvim_set_keymap('n', pattern, action, options)
end

vim.api.nvim_set_keymap('n', '<C-h>', '<C-w><C-h>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w><C-j>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w><C-k>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w><C-l>', {noremap = true, silent = true})

nmapsl('wsh', ':topleft vnew<CR><ESC>')
nmapsl('wsj', ':botright new<CR><ESC>')
nmapsl('wsk', ':topleft new<CR><ESC>')
nmapsl('wsl', ':botright vnew<CR><ESC>')

-- buffer splits
nmapsl('bsh', ':leftabove vnew<CR><ESC>')
nmapsl('bsj', ':rightbelow new<CR><ESC>')
nmapsl('bsk', ':leftabove new<CR><ESC>')
nmapsl('bsl', ':rightbelow vnew<CR><ESC>')

-- search for files within repo
nmapl('ff', ':Files<CR>')
nmapl('fh', ':History<CR>')
-- search for buffers
nmapl('fu', ':Buffers<CR>')
-- search commits for buffer
nmapl('fb', ':BCommits<CR>')
-- search commits
nmapl('fc', ':Commits<CR>')
-- search git files
nmapl('fg', ':GFiles<CR>')
-- search git files that have changed
nmapl('fG', ':GFiles?<CR>')
-- search lines within a file
nmapl('fl', ':BLines<CR>')
-- search for anything with fzf
nmapl('fz', ':FZF<CR>')
-- this ripgrep is basic and requires more filtering. All hidden files, names
-- of files, etc, are searched
nmapl('fr', ':Rg<CR>')
-- Ripgrep looking at all lines in all files, including hidden, but exclude
-- file names from search
nmapl('fa', ':Ag<CR>')
nmapl('fm', ':Marks<CR>')

-- clear last search
nmapsl('fx', ':set hlsearch!<CR>')

nmap('s', '<Plug>(easymotion-overwin-f)')

-- Trouble diagnostics
nmapsl("wd", "<cmd>TroubleToggle workspace_diagnostics<CR>")
nmapsl("dd", "<cmd>TroubleToggle document_diagnostics<CR>")
nmapsl("df", "<cmd>TroubleToggle quickfix<CR>")
nmapsl("gr", "<cmd>TroubleToggle lsp_references<CR>")
nmapsl("dx", "<cmd>TroubleToggle<CR>")
-- nmapsl("ca", "<cmd>lua vim.lsp.buf.code_action()<CR>") -- apply a quickfix for neovim (Code Action)

-- resizing.. allow range one day
nmapsl("rV", ':exe "vertical resize +10"<CR>')
nmapsl("rv", ':exe "vertical resize -10"<CR>')
nmapsl("rH", ':exe "resize " . (winheight(0) * 3/2)<CR>')
nmapsl("rh", ':exe "resize " . (winheight(0) * 2/3)<CR>')
