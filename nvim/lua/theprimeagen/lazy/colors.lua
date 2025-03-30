function ColorMyPencils(color)
	color = color or "nightfox"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

return {
    {
        "folke/tokyonight.nvim",
        config = function()
            require("tokyonight").setup({
                style = "storm",
                transparent = true,
                terminal_colors = true,
                styles = {
                    comments = { italic = false },
                    keywords = { italic = false },
                    sidebars = "dark",
                    floats = "dark",
                },
            })
        end
    },

    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require('rose-pine').setup({
                disable_background = true,
                styles = {
                    italic = false,
                },
            })

            vim.cmd("colorscheme rose-pine")

            ColorMyPencils()
        end
    },

    -- 🌆 City Lights Alternative (Carbonfox from Nightfox)
    {
        "EdenEast/nightfox.nvim",
        config = function()
            require("nightfox").setup({
                options = {
                    transparent = true,
                    styles = {
                        comments = "italic",
                        keywords = "italic",
                        functions = "bold",
                        types = "italic,bold",
                    },
                },
            })
            vim.cmd("colorscheme carbonfox") -- City Lights inspired theme
        end
    },
}

