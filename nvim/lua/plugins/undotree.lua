return {
  "mbbill/undotree",
  lazy = false,
  priority = 1000,
  keys = {
    vim.keymap.set("n", "<C-u>", vim.cmd.UndotreeToggle),
  },
}
