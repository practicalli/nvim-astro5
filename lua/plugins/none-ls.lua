-- ---------------------------------------------------------
-- Configure format & lint tools
--
-- Ensure tools are installed via Mason
-- Pass configuration files to each tool
-- ---------------------------------------------------------

-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- INFO: Config in this file skipped if `PRACTICALLI_NONELS_CONFIG` environment variable is not set to true
local nonels_config = vim.env.PRACTICALLI_NONELS_CONFIG
if nonels_config ~= "true" then return {} end

---@type LazySpec
return {
  -- use mason-lspconfig to configure LSP installations
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "markdownlint",
        -- add more arguments for adding more null-ls sources
      })
      opts.handlers = {
        markdownlint = function(source_name, methods)
          local null_ls = require "null-ls"
          null_ls.register(null_ls.builtins.diagnostics.markdownlint.with {
            -- extra_args = { "--config", "~/.config/markdownlint.yaml" },
            extra_args = { "--config", "~/.config/markdown-lint.jsonc" },
          })
        end,
      }
    end,
  },
}
