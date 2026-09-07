return {
    "neovim/nvim-lspconfig",
    dependencies = {
        -- Automatically install LSPs to stdpath for neovim
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",

        -- Useful status updates for LSP
        "j-hui/fidget.nvim",

        -- LSP capabilities for nvim-cmp
        "hrsh7th/cmp-nvim-lsp",
    },

    config = function()
        -- Mason
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "html",
                "cssls",
                "ts_ls",
                "tailwindcss",
                "clangd",
                "rust_analyzer",
                "pyright",
            },

            automatic_enable = true,
        })

        -- LSP Capabilities
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        -- LSP Configuration
        -- Neovim 0.11+
        -- Lua
        vim.lsp.config("lua_ls", {
            capabilities = capabilities,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = {
                            "vim",
                        },
                    },

                    workspace = {
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true,
                        },
                    },
                },
            },
        })

        -- HTML
        vim.lsp.config("html", {
            capabilities = capabilities,
        })

        -- CSS
        vim.lsp.config("cssls", {
            capabilities = capabilities,
        })

        -- TypeScript / JavaScript
        vim.lsp.config("ts_ls", {
            capabilities = capabilities,
        })

        -- Tailwind CSS
        vim.lsp.config("tailwindcss", {
            capabilities = capabilities,

            filetypes = {
                "html",
                "css",
                "javascriptreact",
                "typescriptreact",
                "svelte",
                "python",
                "pug",
            },
        })

        -- C/C++
        vim.lsp.config("clangd", {
            capabilities = capabilities,
        })

        -- Rust
        vim.lsp.config("rust_analyzer", {
            capabilities = capabilities,
        })

        -- Python
        vim.lsp.config("pyright", {
            capabilities = capabilities,
        })

        -- Fidget
        require("fidget").setup({})
        
        -- LSP Attach
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                local opts = {
                    buffer = ev.buf,
                }

                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)

                vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
                vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
                vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
                vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

                vim.keymap.set("n", "<space>f", function()
                    vim.lsp.buf.format({
                        async = true,
                    })
                end, opts)
            end,
        })

        -- Custom Filetypes
        vim.filetype.add({
            extension = {
                jte = "html",
            },
        })

        -- Diagnostics
        vim.o.updatetime = 250
        vim.api.nvim_create_autocmd(
            "CursorHold",
            {
                pattern = "*",

                callback = function()
                    vim.diagnostic.open_float(
                        nil,
                        {
                            focusable = false,
                        }
                    )
                end,
            }
        )
    end,
}