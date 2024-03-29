return {
  { "williamboman/mason.nvim", opts = { PATH = "append" } },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "ansiblels",
        "cssls",
        "html",
        "intelephense",
        "marksman", -- Markdown
        "jsonls",
        "pyright",
        "lua_ls",
        "taplo",
        "tsserver",
        "yamlls",
      },
    },
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = {
      ensure_installed = {
        "shellcheck",
        "stylua",
        "black",
        "isort",
        "prettierd",
        "shfmt",
        "shellcheck",
      },
      handlers = {
        taplo = function() end, -- disable taplo in null-ls, it's taken care of by lspconfig
      },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    enabled = vim.fn.has "unix" == 1,
    opts = {
      ensure_installed = {
        "bash",
        "cppdbg",
        "delve",
        "js",
        "php",
        "python",
      },
      handlers = {
        js = function()
          local dap = require "dap"
          dap.adapters["pwa-node"] = {
            type = "server",
            port = "${port}",
            executable = { command = vim.fn.exepath "js-debug-adapter", args = { "${port}" } },
          }

          local pwa_node_attach = {
            type = "pwa-node",
            request = "launch",
            name = "js-debug: Attach to Process (pwa-node)",
            proccessId = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
          }
          local function deno(cmd)
            cmd = cmd or "run"
            return {
              request = "launch",
              name = ("js-debug: Launch Current File (deno %s)"):format(cmd),
              type = "pwa-node",
              program = "${file}",
              cwd = "${workspaceFolder}",
              runtimeExecutable = vim.fn.exepath "deno",
              runtimeArgs = { cmd, "--inspect-brk" },
              attachSimplePort = 9229,
            }
          end
          local function typescript(args)
            return {
              type = "pwa-node",
              request = "launch",
              name = ("js-debug: Launch Current File (ts-node%s)"):format(
                args and (" " .. table.concat(args, " ")) or ""
              ),
              program = "${file}",
              cwd = "${workspaceFolder}",
              runtimeExecutable = "ts-node",
              runtimeArgs = args,
              sourceMaps = true,
              protocol = "inspector",
              console = "integratedTerminal",
              resolveSourceMapLocations = {
                "${workspaceFolder}/dist/**/*.js",
                "${workspaceFolder}/**",
                "!**/node_modules/**",
              },
            }
          end
          for _, language in ipairs { "javascript", "javascriptreact" } do
            dap.configurations[language] = {
              {
                type = "pwa-node",
                request = "launch",
                name = "js-debug: Launch File (pwa-node)",
                program = "${file}",
                cwd = "${workspaceFolder}",
              },
              deno "run",
              deno "test",
              pwa_node_attach,
            }
          end
          for _, language in ipairs { "typescript", "typescriptreact" } do
            dap.configurations[language] = {
              typescript(),
              typescript { "--esm" },
              deno "run",
              deno "test",
              pwa_node_attach,
            }
          end
        end,
      },
    },
  },
}
