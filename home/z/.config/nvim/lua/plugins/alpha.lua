--credits to https://github.com/Asthestarsfalll/AstroNvim.config/blob/main/plugins/alpha.lua
--credits to https://github.com/goolord/alpha-nvim/discussions/16 Blake JC94 
math.randomseed(os.time())

GIFS = {
  {"txt/telephone_gif.txt", 30, 30}
}

return{
  'goolord/alpha-nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons'
  },
  opts = function()
    local dashboard = require "alpha.themes.dashboard"
    require "alpha.term"
    local button = require("alpha.themes.dashboard").button
    --local get_icons = require("alpha.themes.dashboard").get_icon

    dashboard.opts.opts.noautocmd = true
    dashboard.section.terminal.opts.redraw = true
    local idx = math.random(1, #GIFS)
    local info = GIFS[idx]
    path = os.getenv "HOME" .. "/.config/nvim/lua/plugins/"

    dashboard.section.header.val= {
      "                                                     ",
      "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
      "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
      "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
      "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
      "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
      "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
      "                                                     ",
    }
    --dashboard.section.terminal.command = "kitty +kitten icat " .. path .. "telephone.gif" .. info[1]
    dashboard.section.terminal.command = "sh " .. path .. "show.sh " .. path .. info[1]
    dashboard.section.terminal.width = info[2]
    dashboard.section.terminal.height = info[3]

    dashboard.section.buttons.val = {
      button( "e", "  > New file" , ":ene <BAR> startinsert <CR>"),
      button( "f", "*  > Find file", ":cd $HOME/projects | Telescope find_files<CR>"),
      button( "r", "  > Recent"   , ":Telescope oldfiles<CR>"),
      button( "s", "  > Settings" , ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
      button( "q", "X  > Quit NVIM", ":qa<CR>"),
    }

    dashboard.opts.layout = {
      dashboard.section.header,
      --dashboard.section.terminal,
      {type = "padding", val = 2},
      dashboard.section.buttons,
      dashboard.section.footer,
    }
    return dashboard
  end,
  config = function(_, opts)
    require('alpha').setup(opts.config)

    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyVimStarted",
      desc = "Add Alpha dashboard footer",
      once = true,
      callback = function()
        local stats = require("lazy").stats()
        local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
        opts.section.footer.val = { " ", " ", " ", "Loaded " .. stats.count .. " plugins  in " .. ms .. "ms" }
        opts.section.footer.opts.hl = "DashboardFooter"
        pcall(vim.cmd.AlphaRedraw)
      end,
    })
  end,
}
