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
                "pyright",
                "lua_ls",
                "ts_ls",
                "rust_analyzer",
                "svelte",
                "html",
                "cssls",
                "tailwindcss",
                "jdtls",
            },

            automatic_enable = true,
        })

        -- LSP Capabilities
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        -- LSP Configuration
        -- Neovim 0.11+

        -- Java
        -- vim.lsp.config("jdtls", {
        --     capabilities = capabilities,
        -- })

        -- TypeScript / JavaScript
        vim.lsp.config("ts_ls", {
            capabilities = capabilities,
        })

        -- CSS
        vim.lsp.config("cssls", {
            capabilities = capabilities,
        })

        -- HTML
        vim.lsp.config("html", {
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

        -- Fidget
        require("fidget").setup({})
        
        -- LSP Attach
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),

            callback = function(ev)
                -- Editor Settings
                vim.bo[ev.buf].tabstop = 4
                vim.bo[ev.buf].shiftwidth = 4
                vim.bo[ev.buf].expandtab = true
                vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
                local opts = {
                    buffer = ev.buf,
                }

                -- LSP Keymaps
                vim.keymap.set(
                    "n",
                    "gD",
                    vim.lsp.buf.declaration,
                    opts
                )

                vim.keymap.set(
                    "n",
                    "gd",
                    vim.lsp.buf.definition,
                    opts
                )

                vim.keymap.set(
                    "n",
                    "K",
                    vim.lsp.buf.hover,
                    opts
                )

                vim.keymap.set(
                    "n",
                    "gi",
                    vim.lsp.buf.implementation,
                    opts
                )

                vim.keymap.set(
                    "n",
                    "<space>wa",
                    vim.lsp.buf.add_workspace_folder,
                    opts
                )

                vim.keymap.set(
                    "n",
                    "<space>wr",
                    vim.lsp.buf.remove_workspace_folder,
                    opts
                )

                vim.keymap.set(
                    "n",
                    "<space>wl",
                    function()
                        print(
                            vim.inspect(
                                vim.lsp.buf.list_workspace_folders()
                            )
                        )
                    end,
                    opts
                )

                vim.keymap.set(
                    "n",
                    "<space>D",
                    vim.lsp.buf.type_definition,
                    opts
                )

                vim.keymap.set(
                    "n",
                    "<space>rn",
                    vim.lsp.buf.rename,
                    opts
                )

                vim.keymap.set(
                    { "n", "v" },
                    "<space>ca",
                    vim.lsp.buf.code_action,
                    opts
                )

                vim.keymap.set(
                    "n",
                    "gr",
                    vim.lsp.buf.references,
                    opts
                )

                -- Format
                vim.keymap.set(
                    "n",
                    "<space>f",
                    function()
                        vim.lsp.buf.format({
                            async = true,
                        })
                    end,
                    opts
                )
                
                -- Auto Format on Save
                local client =
                    vim.lsp.get_client_by_id(ev.data.client_id)

                if client
                    and client.server_capabilities.documentFormattingProvider
                then
                    vim.api.nvim_create_autocmd(
                        "BufWritePre",
                        {
                            group = vim.api.nvim_create_augroup(
                                "AutoFormatOnSave",
                                {
                                    clear = false,
                                }
                            ),

                            buffer = ev.buf,

                            callback = function()
                                vim.lsp.buf.format({
                                    async = true,
                                })
                            end,
                        }
                    )
                end
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