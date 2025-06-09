return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      -- pyright will be automatically installed with mason and loaded with lspconfig
      gopls = {
        analyses = { unusedparams = true },
        buildFlags = { "-tags=integration,aeris,hbase" },
      },
    },
  },
}
