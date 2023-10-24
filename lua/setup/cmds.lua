vim.api.nvim_create_user_command("Rmbufs",
    function()
        print("Clearing background buffers...")
        vim.cmd("%bd|e#|bd#")
    end,
{})


vim.api.nvim_create_user_command("Build",
    function(opts)
        local args = string.gmatch(opts.args, "%S+")

        local f = io.open('BuildConfigList.txt', "rb")
        if not f then return nil end
        local content = f:read "*a"
        f:close()

        content = content:gsub("%s+", "\n")
        local matches = {}
        for line in string.gmatch(content, "([^\n]+)") do
            table.insert(matches, line)
        end

        for arg in args do
            local tempMatches = {}
            local keyword = arg

            for k,cfg in pairs(matches) do
                if cfg:find(string.upper(keyword)) then
                    table.insert(tempMatches, cfg)
                end
            end
                
            matches = {}
            for k,v in pairs(tempMatches) do
                matches[k] = v
            end
        end

        local cdCmd = "cd Build/" .. matches[1] .. "\r\n"  -- cd to first match

        vim.api.nvim_command('vsplit new')                 -- split a new window
        local win_handle = vim.api.nvim_tabpage_get_win(0) -- get the window handler
        local buf_handle = vim.api.nvim_win_get_buf(0)     -- get the buffer handler
        jobID = vim.api.nvim_call_function("termopen", {"cmd"})
        vim.api.nvim_buf_set_option(buf_handle, 'modifiable', true)
        vim.api.nvim_buf_set_lines(buf_handle, 0, 0, true, {"ls"})

        vim.api.nvim_chan_send(jobID, cdCmd)
        vim.api.nvim_chan_send(jobID, "mingw32-make\r\n")
    end,
    {
        nargs = '*',
    }
)


vim.api.nvim_create_user_command("Header",
    function()
        print("Generating header from filename...")
        local filename = string.gsub(vim.api.nvim_buf_get_name(0), vim.loop.cwd(), '')

        filename = filename:match("[^/\\]*.h$") 

        if(filename == nil)
        then
            print("Invalid Filename! Must have extension .h")
            return nil
        end

        local headerPrep = string.upper(filename)
        headerPrep = string.gsub(headerPrep, '%.', '_') .. '_'

        local headerTop = '/*****************************************************************************************************************'
        local headerBot = '*****************************************************************************************************************/'

        local includeFilesHeader = ' *                  Include Files' 

        local definesHeader      = ' *                  Defines' 

        local funcSigHeader      = ' *                  Function Signatures'

        local funcDecHeader      = ' *                  Function Declaration'

        local eofHeader          = ' *                  End of File'

        vim.api.nvim_buf_set_lines(0, 0, 30, false, {'#ifndef ' .. headerPrep, '#define ' .. headerPrep, 
                                                    headerTop, includeFilesHeader, headerBot, '', 
                                                    headerTop, definesHeader, headerBot, '', 
                                                    headerTop, funcSigHeader, headerBot, '',
                                                    headerTop, funcDecHeader, headerBot, '',
                                                    headerTop, eofHeader, headerBot, 
                                                    '#endif'})
    end,
    {}
)

