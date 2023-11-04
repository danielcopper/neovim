local icons = require("copper.plugins.extras.icons")

return {
    -- NOTE: Search for plugins that enable xml comments and such
    -- Code Comments
    {
        "numToStr/Comment.nvim",
        even = { "BufEnter" },
        config = true,
    },
    {
        -- TODO: Find out what other plugin? causes the other highlights like TODO
        "folke/todo-comments.nvim",
        cmd = { "TodoTrouble", "TodoTelescope" },
        event = "BufReadPost",
        opts = {
            signs = true,      -- show icons in the signs column
            sign_priority = 8, -- sign priority
            -- keywords recognized as todo comments
            keywords = {
                FIX = {
                    icon = icons.ui.Bug,                        -- icon used for the sign, and in search results
                    color = "error",                            -- can be a hex color, or a named color (see below)
                    alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
                    -- signs = false, -- configure signs for some keywords individually
                },
                TODO = { icon = icons.ui.CheckAlt2, color = "info", alt = { "todo", "ToDo", "Todo", "toDo" } },
                HACK = { icon = icons.ui.Fire, color = "warning", alt = { "hack", "Hack" } },
                WARN = {
                    icon = icons.diagnostics.Warning,
                    color = "warning",
                    alt = { "WARNING", "XXX", "warn", "warning" },
                },
                -- TODO:Find this icon that doesn't work on linux
                -- PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
                PERF = { icon = icons.ui.History, alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
                -- NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
                NOTE = { icon = icons.ui.Electric, color = "hint", alt = { "INFO" } },
                TEST = { icon = icons.ui.Time, color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
            },
            gui_style = {
                fg = "NONE",       -- The gui style to use for the fg highlight group.
                bg = "BOLD",       -- The gui style to use for the bg highlight group.
            },
            merge_keywords = true, -- when true, custom keywords will be merged with the defaults
            -- highlighting of the line containing the todo comment
            -- * before: highlights before the keyword (typically comment characters)
            -- * keyword: highlights of the keyword
            -- * after: highlights after the keyword (todo text)
            highlight = {
                multiline = true,                -- enable multine todo comments
                multiline_pattern = "^.",        -- lua pattern to match the next multiline from the start of the matched keyword
                multiline_context = 10,          -- extra lines that will be re-evaluated when changing a line
                before = "",                     -- "fg" or "bg" or empty
                keyword = "wide",                -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
                after = "fg",                    -- "fg" or "bg" or empty
                pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
                comments_only = true,            -- uses treesitter to match keywords in comments only
                max_line_len = 400,              -- ignore lines longer than this
                exclude = {},                    -- list of file types to exclude highlighting
            },
            -- list of named colors where we try to extract the guifg from the
            -- list of highlight groups or use the hex color if hl not found as a fallback
            colors = {
                error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
                warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
                info = { "DiagnosticInfo", "#2563EB" },
                hint = { "DiagnosticHint", "#10B981" },
                default = { "Identifier", "#7C3AED" },
                test = { "Identifier", "#FF00FF" },
            },
            search = {
                command = "rg",
                args = {
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                },
                -- regex that will be used to match keywords.
                -- don't replace the (KEYWORDS) placeholder
                pattern = [[\b(KEYWORDS):]], -- ripgrep regex
                -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
            },
        },
        keys = {
            vim.keymap.set("n", "]t", function()
                require("todo-comments").jump_next()
            end, { desc = "Next todo comment" }),
            vim.keymap.set("n", "[t", function()
                require("todo-comments").jump_prev()
            end, { desc = "Previous todo comment" }),
            vim.keymap.set("n", "<leader>xt", "<Cmd>TodoTrouble<CR>", { desc = "Open TodoTrouble" }),
            vim.keymap.set("n", "<leader>xT", "<Cmd>TodoTrouble<CR>", { desc = "Todo/Fix/Fixme (Trouble)" }),
        },
    },
}