return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local function fmt_mode(s)
      local mode_map = {
        ["COMMAND"] = "COMMND",
        ["V-BLOCK"] = "VBLOCK",
        ["TERMINAL"] = "TERMNL",
        ["V-REPLACE"] = "VREPLC",
        ["O-PENDING"] = "0PNDNG",
      }
      return mode_map[s] or s
    end

    local text_hl
    local icon_hl
    local green
    local yellow

    if vim.g.colors_name == "nordic" then
      local C = require("nordic.colors")
      text_hl = { fg = C.gray3 }
      icon_hl = { fg = C.gray4 }
      green = C.green.base
      yellow = C.yellow.base
    elseif vim.g.colors_name == "tokyonight-night" then
      local C = require("tokyonight.colors.moon")
      text_hl = { fg = C.fg_gutter }
      icon_hl = { fg = C.dark3 }
      green = C.green1
      yellow = C.yellow
    end

    local function diff_source()
      local gitsigns = vim.b.gitsigns_status_dict
      if gitsigns then
        return {
          added = gitsigns.added,
          modified = gitsigns.changed,
          removed = gitsigns.removed,
        }
      end
    end

    local function get_short_cwd()
      local cwd = vim.fn.getcwd()
      local short_cwd = vim.fn.fnamemodify(cwd, ":~")
      return short_cwd
    end

    local tree = {
      sections = {
        lualine_a = {
          {
            "mode",
            fmt = fmt_mode,
            icon = { "" },
            separator = { right = " ", left = "" },
          },
        },
        lualine_b = {},
        lualine_c = {
          {
            get_short_cwd,
            padding = 0,
            icon = { "   ", color = icon_hl },
            color = text_hl,
          },
        },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {
          {
            "location",
            icon = { "", align = "left" },
          },
          {
            "progress",
            icon = { "", align = "left" },
            separator = { right = "", left = "" },
          },
        },
      },
      filetypes = { "NvimTree" },
    }

    local function telescope_text()
      return "Telescope"
    end

    local telescope = {
      sections = {
        lualine_a = {
          {
            "mode",
            fmt = fmt_mode,
            icon = { "" },
            separator = { right = " ", left = "" },
          },
        },
        lualine_b = {},
        lualine_c = {
          {
            telescope_text,
            color = text_hl,
            icon = { "  ", color = icon_hl },
          },
        },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {
          {
            "location",
            icon = { "", align = "left", color = icon_hl },
          },
          {
            "progress",
            icon = { "", align = "left", color = icon_hl },
            separator = { right = "", left = "" },
          },
        },
      },
      filetypes = { "TelescopePrompt" },
    }

    function current_buffer_filetype()
      return vim.bo.filetype
    end

    function current_buffer_lsp()
      local buf_ft = current_buffer_filetype()
      local clients = vim.lsp.get_active_clients()
      if next(clients) == nil then
        return ""
      end
      local current_clients = ""

      for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
          current_clients = current_clients .. client.name .. " "
        end
      end

      return current_clients
    end

    require("lualine").setup({
      sections = {
        lualine_a = {
          {
            "mode",
            fmt = fmt_mode,
            icon = { "" },
            separator = { right = " ", left = "" },
          },
        },
        lualine_b = {},
        lualine_c = {
          {
            "branch",
            color = text_hl,
            icon = { " ", color = icon_hl },
            separator = "",
            padding = 0,
          },
          {
            "diff",
            color = text_hl,
            icon = { "  ", color = text_hl },
            source = diff_source,
            symbols = {
              added = " ",
              modified = " ",
              removed = " ",
            },
            diff_color = {
              added = icon_hl,
              modified = icon_hl,
              removed = icon_hl,
            },
            padding = 0,
          },
        },
        lualine_x = {
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            symbols = {
              error = " ",
              warn = " ",
              info = " ",
              hint = "󱤅 ",
              other = "󰠠 ",
            },
            colored = true,
            padding = 2,
          },
          {
            current_buffer_lsp,
            padding = 1,
            color = text_hl,
            icon = { " ", color = icon_hl },
          },
          {
            "copilot",
            padding = 1,
            color = icon_hl,
            show_colors = true,
            symbols = {
              status = {
                icons = {
                  enabled = " ",
                  disabled = " ",
                  warning = " ",
                  unknown = " ",
                },
                hl = {
                  enabled = green,
                  disabled = icon_hl.fg,
                  warning = yellow,
                  unknown = icon_hl.fg,
                },
              },
              spinners = { " " },
              spinner_color = green,
            },
          },
        },
        lualine_y = {},
        lualine_z = {
          {
            "location",
            icon = { "", align = "left" },
          },
          {
            "progress",
            icon = { "", align = "left" },
            separator = { right = "", left = "" },
          },
        },
      },
      options = {
        disabled_filetypes = { "dashboard" },
        globalstatus = true,
        section_separators = { left = " ", right = " " },
        component_separators = { left = "", right = "" },
      },
      extensions = {
        telescope,
        ["nvim-tree"] = tree,
      },
    })

    -- Ensure correct background for lualine.
    vim.api.nvim_create_autocmd({ "BufWinEnter", "WinEnter" }, {
      callback = function(_)
        require("lualine").setup({})
      end,
      pattern = { "*.*" },
      once = true,
    })
  end,
}
