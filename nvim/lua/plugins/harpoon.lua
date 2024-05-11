return {
  "ThePrimeagen/harpoon",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = true,
  keys = {
    { "<leader>a", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Mark file with harpoon" },
    { "<C-e>", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Show harpoon marks" },

    { "<C-h>", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", desc = "Harpoon buffer 1" },
    { "<C-t>", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", desc = "Harpoon buffer 2" },
    { "<C-n>", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", desc = "Harpoon buffer 3" },
    { "<C-s>", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", desc = "Harpoon buffer 4" },
  },
}
