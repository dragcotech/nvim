return {
    "stevearc/conform.nvim",
    event = {
        "BufWritePre",
    },

    config = function()
        require("conform").setup({
            formatters_by_ft = {
                -- C
                c = {
                    "clang_format_custom",
                },

                -- C++
                cpp = {
                    "clang_format_custom",
                },

                -- Rust
                rust = {
                    "rustfmt",
                },

                -- Lua
                lua = {
                    "stylua",
                },

                -- Python
                python = {
                    "ruff_format",
                },

                -- Java
                java = {
                    "google_java_format",
                },

                -- JavaScript
                javascript = {
                    "prettier",
                },

                -- TypeScript
                typescript = {
                    "prettier",
                },

                -- React
                javascriptreact = {
                    "prettier",
                },

                typescriptreact = {
                    "prettier",
                },

                -- HTML
                html = {
                    "prettier",
                },

                -- CSS
                css = {
                    "prettier",
                },

                -- JSON
                json = {
                    "prettier",
                },

                jsonc = {
                    "prettier",
                },

                -- Shell
                sh = {
                    "shfmt",
                },

                bash = {
                    "shfmt",
                },

                -- Markdown
                markdown = {
                    "prettier",
                },
            },

            -- ==================================
            -- Custom Formatters
            -- ==================================
            formatters = {
                clang_format_custom = {
                    command = "clang-format",

                    args = function(_, ctx)
                        local indent_width =
                            vim.bo[ctx.buf].shiftwidth

                        if indent_width == 0 then
                            indent_width = 4
                        end

                        return {
                            "--style=" .. vim.json.encode({
                                BasedOnStyle = "LLVM",
                                IndentWidth = indent_width,
                                TabWidth = indent_width,
                                UseTab = "Never",
                            }),

                            "--assume-filename=" .. ctx.filename,
                        }
                    end,

                    stdin = true,
                },
            },

            -- ==================================
            -- Format on Save
            -- ==================================
            format_on_save = {
                timeout_ms = 500,
                lsp_format = "fallback",
            },
        })
    end,
}