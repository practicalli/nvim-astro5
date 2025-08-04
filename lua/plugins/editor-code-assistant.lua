-- ---------------------------------------------------------
-- Editor Code Assistant using OpenAI
--
-- Plugin spec to add ECA neovim plugin
-- https://github.com/editor-code-assistant/eca-nvim
--
-- Sets OpenAI key from Operating System environment variable `OPENAI_API_KEY`
--
-- WARNING: OpenAI is a commercial service that requires payment
-- WARNING: Disabled by default
-- ---------------------------------------------------------

if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
  "editor-code-assistant/eca-nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  ft = { "clojure" }, -- ECA only runs manually at present
  opts = {
    server = {
      spawn_args = {
        env = { OPENAI_API_KEY = vim.env.OPENAI_API_KEY }, -- set key from OS Env Var of same name
      },
    },
  },
}
