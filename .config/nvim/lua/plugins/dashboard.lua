return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  opts = function()
    -- local logo = [[
    --
    --  ███╗   ██╗██╗ ██████╗ ██╗  ██╗████████╗
    --  ████╗  ██║██║██╔════╝ ██║  ██║╚══██╔══╝
    --  ██╔██╗ ██║██║██║  ███╗███████║   ██║
    --  ██║╚██╗██║██║██║   ██║██╔══██║   ██║
    --  ██║ ╚████║██║╚██████╔╝██║  ██║   ██║
    --  ╚═╝  ╚═══╝╚═╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝
    --
    --
    --  ]]
    local logo = [[
                    ▄ ▄                   
                ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄     
                █ ▄ █▄█ ▄▄▄ █ █▄█ █ █     
             ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █     
           ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄  
           █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄
         ▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █
         █▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █
             █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    
    ]]

    logo = string.rep("\n", 8) .. logo .. "\n\n"

    local opts = {
      theme = "doom",
      hide = {
        -- this is taken care of by lualine
        -- enabling this messes up the actual laststatus setting after loading a file
        statusline = false,
      },
      config = {
        header = vim.split(logo, "\n"),
        -- stylua: ignore
        center = {
          { action = "Telescope find_files",                                    desc = " Find File",       icon = " ", key = "f" },
          { action = "ene | startinsert",                                        desc = " New File",        icon = " ", key = "n" },
          { action = "Telescope oldfiles",                                       desc = " Recent Files",    icon = " ", key = "o" },
          { action = "Telescope live_grep",                                      desc = " Find Text",       icon = " ", key = "g" },
          { action = 'lua require("persistence").load()',                        desc = " Restore Session", icon = " ", key = "r" },
          { action = "Lazy",                                                     desc = " Lazy",            icon = "󰒲 ", key = "l" },
          { action = "qa",                                                       desc = " Quit",            icon = " ", key = "q" },
        },
      },
    }

    for _, button in ipairs(opts.config.center) do
      button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
      button.key_format = "  %s"
    end

    return opts
  end,
}
