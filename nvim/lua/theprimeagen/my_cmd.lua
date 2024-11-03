vim.api.nvim_create_user_command('On', function(opts)
    local note_name = opts.args
    local note_path = '/notes/' .. note_name .. '.md'
    vim.cmd('ObsidianNew ' .. note_path)
end, { nargs = 1 })

vim.api.nvim_create_user_command('Ont', function(opts)
    local note_name = opts.fargs[1]
    local template = opts.fargs[2]
    local template_path = vim.fn.expand('~/Vaults/work/templates/' .. template .. '.md')
    local note_path = vim.fn.expand('~/Vaults/work/notes/' .. note_name .. '.md')
    vim.cmd('e ' .. note_path)
    vim.cmd('0r ' .. template_path)
end, { nargs = '*' })

vim.api.nvim_create_user_command('Ons', function()
    local current_file = vim.fn.expand('%:p')
    local file_name = vim.fn.expand('%:t')
    local scrap_folder_path = vim.fn.expand('~/Vaults/work/scrap/' .. file_name)
    vim.cmd('silent! saveas' .. scrap_folder_path)
    vim.fn.delete(current_file)
    vim.cmd('silent! bwipeout' .. current_file)
    print(file_name .. ' moved to the scrap folder')
end, {})

vim.api.nvim_create_user_command('Ook', function(opts)
    local folder_name = opts.args

    local current_file = vim.fn.expand('%:p')
    local file_name = vim.fn.expand('%:t')

    local folder_path = vim.fn.expand('~/Vaults/work/okay/' .. folder_name)
    local new_file_path = folder_path .. '/' .. file_name

    if vim.fn.isdirectory(folder_path) == 0 then
        vim.fn.mkdir(folder_path, 'p')
    end

    vim.cmd('silent! saveas ' .. new_file_path)

    vim.fn.delete(current_file)
    vim.cmd('silent! bwipeout')

    print(file_name .. ' has been moved to ' .. folder_path)
end, { nargs = 1 })

