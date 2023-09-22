local function nmapsl(pattern, action)
	local options = { noremap = true, silent = true }
	vim.api.nvim_set_keymap('n', '<leader>' .. pattern, action, options)
end

local function nmapl(pattern, action)
	local options = { noremap = true, silent = false }
	vim.api.nvim_set_keymap('n', '<leader>' .. pattern, action, options)
end

local function nmap(pattern, action)
	local options = { noremap = true, silent = false }
	vim.api.nvim_set_keymap('n', pattern, action, options)
end

local function nmaps(pattern, action)
	local options = { noremap = true, silent = true }
	vim.api.nvim_set_keymap("n", pattern, action, options)
end

vim.api.nvim_set_keymap('n', '<C-h>', '<C-w><C-h>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w><C-j>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w><C-k>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w><C-l>', { noremap = true, silent = true })

-- window splits
nmapsl('wsh', ':topleft vnew<CR><ESC>')
nmapsl('wsj', ':botright new<CR><ESC>')
nmapsl('wsk', ':topleft new<CR><ESC>')
nmapsl('wsl', ':botright vnew<CR><ESC>')

-- buffer splits
nmapsl('bsh', ':leftabove vnew<CR><ESC>')
nmapsl('bsj', ':rightbelow new<CR><ESC>')
nmapsl('bsk', ':leftabove new<CR><ESC>')
nmapsl('bsl', ':rightbelow vnew<CR><ESC>')

-- tab stuff
nmapsl("tc", ":tabnew<CR>")
nmapsl("tx", ":tabclose<CR>")
nmapsl("ts", ":tab split<CR> ")
nmapsl("tn", ":tabn<CR> ")
nmapsl("tp", ":tabp<CR> ")

-- lsp-specific settings
nmap("gf", "<cmd>lua vim.lsp.buf.format({ async = false })<CR>")
nmaps("rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
nmaps("gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
nmaps("gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
nmaps("gr", "<cmd>lua vim.lsp.buf.references()<CR>")
nmaps("gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
nmap("K", "<cmd>lua vim.lsp.buf.hover()<CR>")         -- no idea why but everyone does `K`
nmap("f", "<cmd>lua vim.diagnostic.open_float()<CR>") -- F for float
nmap("dn", "<cmd>lua vim.diagnostic.goto_prev()<CR>") -- dn: diag next
nmap("dp", "<cmd>lua vim.diagnostic.goto_next()<CR>") -- dp: diag prev

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

-- DAP debugger
nmapsl("b", ":lua require'dap'.toggle_breakpoint()<CR>")
nmapsl("B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
nmapsl("lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
nmapsl("dr", ":lua require'dap'.repl.open()<CR>")
nmapsl("dl", ":lua require'dap'.run_last()<CR>")
nmap("<F5>", ":lua require'dap'.continue()<CR>")
nmap("<F1>", ":lua require'dap'.step_over()<CR>")
nmap("<F2>", ":lua require'dap'.step_into()<CR>")
nmap("<F3>", ":lua require('dap')step_out()<CR>")
-- DAP Go extensions
nmapsl("td", ":lua require('dap-go').debug_test()<CR>")
nmapsl("tl", ":lua require('dap-go').debug_last_test()<CR>")
-- DAP UI
nmapsl("uio", ":lua require('dapui').open()<CR>")
nmapsl("uic", ":lua require('dapui').close()<CR>")
nmap("<F4>", ":lua require('dapui').eval()<CR>")

-- Copilot
-- nmaps("<c-s>", "<cmd>lua require('copilot.suggestion').toggle_auto_trigger()<CR>")

