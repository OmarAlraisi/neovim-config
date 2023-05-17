local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  'tsserver',
  'eslint',
  'rust_analyzer',
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	-- `Enter` key to confirm completion
	['<CR>'] = cmp.mapping.confirm({select = false}),

	-- Ctrl+Space to trigger completion menu
	['<C-.'] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "<leader>lf", function() vim.lsp.buf.format() end)
  vim.keymap.set("n", "<leader>ld", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "<leader>lK", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>law", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>lD", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>lac", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>lar", function() vim.lsp.buf.rename() end, opts)

end)

lsp.setup()

local ih = require("inlay-hints")
ih.setup()

require("rust-tools").setup({
    tools = {
        on_initialized = function()
            ih.set_all()
        end,
        inlay_hints = {
            auto = false,
        },
    },
    server = {
        on_attach = function(c, b)
            ih.on_attach(c, b)
        end,
    },
})

vim.diagnostic.config({
    virtual_text = true
})
