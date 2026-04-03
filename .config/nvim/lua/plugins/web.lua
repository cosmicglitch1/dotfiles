return {
{
  "rest-nvim/rest.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    opts = function (_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      table.insert(opts.ensure_installed, "http")
    end,
  }
},
  {
  "tpope/vim-fugitive",
  cmd = {
    "G",
    "Git",
    "Gdiffsplit",
    "Gread",
    "Gwrite",
    "Ggrep",
    "GMove",
    "GDelete",
    "GBrowse",
  },
  keys = {
    { "<leader>gs", ":Git<CR>", desc = "Git status" },
    { "<leader>gc", ":Git commit<CR>", desc = "Git commit" },
    { "<leader>gp", ":Git push<CR>", desc = "Git push" },
    { "<leader>gl", ":Git log<CR>", desc = "Git log" },
  },
}
}
