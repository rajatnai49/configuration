return {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    cmd = { "ObsidianOpen", "ObsidianQuickSwitch" },
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = true,
    opts = {
        workspaces = {
            {
                name = "work",
                path = "~/Vaults/work",
            },
        },

        completion = {
            -- Set to false to disable completion.
            nvim_cmp = true,
            -- Trigger completion at 2 chars.
            min_chars = 2,
        },


        mappings = {
            ["gf"] = {
                action = function()
                    return require("obsidian").util.gf_passthrough()
                end,
                opts = { noremap = false, expr = true, buffer = true },
            },
            ["<leader>ch"] = {
                action = function()
                    return require("obsidian").util.toggle_checkbox()
                end,
                opts = { buffer = true },
            },
            ["<leader>cr"] = {
                action = function()
                    return require("obsidian").util.smart_action()
                end,
                opts = { buffer = true, expr = true },
            },
            ["leader>bl"] = {
                action = function()
                    vim.cmd("ObsidianBackLinks")
                end,
                opts = { buffer = true, expr = true },
            },
            ["leader>tg"] = {
                action = function()
                    vim.cmd("ObsidianTags")
                end,
                opts = { noremap = false, buffer = true, expr = true },
            },
        },

        templates = {
            folder = "templates",
            date_format = "%Y-%m-%d",
            time_format = "%H:%M",
            -- Passing custom variables in the files
            substitutions = {
                name = "rajat",
            },
        },
    },
}
