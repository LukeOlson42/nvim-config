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
