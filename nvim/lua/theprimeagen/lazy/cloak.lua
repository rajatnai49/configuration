return {
    "laytan/cloak.nvim",
    config = function()
        require("cloak").setup({
            enabled = true,
            cloak_character = "*",
            highlight_group = "Comment",
            patterns = {
                {
                    file_pattern = {
                        ".env*",
                        "wrangler.toml",
                        ".dev.vars",
                    },
                    cloak_pattern = "=.+"
                },
            },
        })

        -- Keybinding to toggle cloak
        vim.api.nvim_set_keymap("n", "<leader>tc", ":CloakToggle<CR>", { noremap = true, silent = true })
    end
}

