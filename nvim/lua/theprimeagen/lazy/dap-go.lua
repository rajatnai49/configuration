return {
  "leoluz/nvim-dap-go",
  dependencies = {
    "mfussenegger/nvim-dap",           -- core dap
    "rcarriga/nvim-dap-ui",            -- debugger UI
    "theHamsta/nvim-dap-virtual-text", -- inline variable text
  },
  config = function()
    -- Setup dap-go
    require("dap-go").setup()

    -- Setup dap-ui
    local dap, dapui = require("dap"), require("dapui")
    dapui.setup()

    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end

    -- Setup dap-virtual-text
    require("nvim-dap-virtual-text").setup()

    -- Keymaps
    vim.keymap.set("n", "<F5>", function() dap.continue() end, { desc = "DAP Continue" })
    vim.keymap.set("n", "<F10>", function() dap.step_over() end, { desc = "DAP Step Over" })
    vim.keymap.set("n", "<F11>", function() dap.step_into() end, { desc = "DAP Step Into" })
    vim.keymap.set("n", "<F12>", function() dap.step_out() end, { desc = "DAP Step Out" })
    vim.keymap.set("n", "<leader>b", function() dap.toggle_breakpoint() end, { desc = "DAP Toggle Breakpoint" })
    vim.keymap.set("n", "<leader>B", function()
      dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
    end, { desc = "DAP Conditional Breakpoint" })
    vim.keymap.set("n", "<leader>dr", function() dap.repl.open() end, { desc = "DAP REPL" })
    vim.keymap.set("n", "<leader>dl", function() dap.run_last() end, { desc = "DAP Run Last" })

    -- Go specific helpers
    vim.keymap.set("n", "<leader>dt", function() require("dap-go").debug_test() end,
      { desc = "Debug Go Test" })
    vim.keymap.set("n", "<leader>dl", function() require("dap-go").debug_last_test() end,
      { desc = "Debug Last Go Test" })

    vim.keymap.set("n", "<leader>dus", function()
        local widgets = require("dap.ui.widgets");
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open()
      end,
      { desc = "Open debugging sidebar" }
    )
  end,
}
