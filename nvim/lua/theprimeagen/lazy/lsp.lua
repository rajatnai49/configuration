return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "j-hui/fidget.nvim",
  },

  config = function()
    local cmp = require('cmp')
    local cmp_lsp = require("cmp_nvim_lsp")
    local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      cmp_lsp.default_capabilities()
    )

    require("fidget").setup({})
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "rust_analyzer",
        "gopls",
        "tailwindcss",
        "ruff",
        "pyright",
      },
      handlers = {
        function(server_name) -- default handler (optional)
          require("lspconfig")[server_name].setup {
            capabilities = capabilities
          }
        end,

        ["gopls"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.gopls.setup {
            capabilities = capabilities,
            settings = {
              gopls = {
                -- completeUnimported = true
              }
            }
          }
        end,

        ["lua_ls"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.lua_ls.setup {
            capabilities = capabilities,
            settings = {
              Lua = {
                runtime = { version = "Lua 5.1" },
                diagnostics = {
                  globals = { "vim", "it", "describe", "before_each", "after_each" },
                }
              }
            }
          }
        end,

        ["tailwindcss"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.tailwindcss.setup {
            capabilities = capabilities,
            root_dir = function(fname)
              return require('lspconfig.util').root_pattern(
                'assets/tailwind.config.ts',
                'assets/tailwind.config.js',
                'assets/tailwind.config.cjs',
                'assets/package.json',
                '.git'
              )(fname) or vim.fn.getcwd()
            end,
            settings = {
              tailwindCSS = {
                experimental = {
                  classRegex = {
                    { "class[:]%s*\"([^\"]*)\"",   1 },
                    { "~H\"([^\"]*)\"",            1 },
                    { "([\"'`][^\"'`]*.*?[\"'`])", "[\"'`]([^\"'`]*)[.*?[\"'`]" }
                  },
                },
                includeLanguages = {
                  elixir = 'html-eex',
                  eelixir = 'html-eex',
                  heex = 'html-eex',
                },
              },
            },
          }
        end,

        ["pyright"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.pyright.setup {
            capabilities = capabilities,
            root_dir = function(fname)
              return require("lspconfig.util").root_pattern("pyproject.toml", "setup.py", "setup.cfg",
                "requirements.txt", ".git")(fname) or vim.fn.getcwd()
            end,
            settings = {
              python = {
                analysis = {
                  autoSearchPaths = true,
                  useLibraryCodeForTypes = true,
                  diagnosticMode = "workspace"
                }
              }
            }
          }
        end,

        ["ruff"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.ruff.setup {
            capabilities = capabilities,
            root_dir = function(fname)
              return require("lspconfig.util").root_pattern("pyproject.toml", "setup.py", "setup.cfg",
                "requirements.txt", ".git")(fname) or vim.fn.getcwd()
            end,
            settings = {
              ruff = {
                lint = true,
                format = true,
                organizeImports = true,
              },
            },
          }
        end,

      }
    })

    local cmp_select = { behavior = cmp.SelectBehavior.Select }

    cmp.setup({
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
      }, {
        { name = 'buffer' },
      })
    })

    vim.diagnostic.config({
      float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    })
  end
}
