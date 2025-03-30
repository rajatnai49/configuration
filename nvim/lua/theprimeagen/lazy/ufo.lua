return {
    'kevinhwang91/nvim-ufo',
    dependencies = {
        'kevinhwang91/promise-async',
    },
    config = function()
        -- vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
        -- vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

        vim.keymap.set('n', 'zrr', require('ufo').openFoldsExceptKinds)
        vim.keymap.set('n', 'zmm', require('ufo').closeFoldsWith)


        require('ufo').setup({
            provider_selector = function(bufnr, filetype, buftype)
                return { 'treesitter', 'indent' }
            end
        })
    end,
}
