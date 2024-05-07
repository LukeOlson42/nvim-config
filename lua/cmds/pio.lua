-- this will be used to interface with PlatformIO eventually

local new_command = vim.api.nvim_create_user_command

local function CreateMakefile()
    local MakefileData =
[[# Uncomment lines below if you have problems with $PATH
#SHELL := /bin/bash
#PATH := /usr/local/bin:$(PATH)

all:
    pio -f -c vim run

upload:
    pio -f -c vim run --target upload

clean:
    pio -f -c vim run --target clean

program:
    pio -f -c vim run --target program

uploadfs:
    pio -f -c vim run --target uploadfs

update:
    pio -f -c vim update
    ]]
    local makefile = io.open("Makefile", 'w')
    if makefile ~= nil then
        makefile:write(MakefileData)
        makefile:close()
    else
        print("Failed to create Makefile!")
    end
end

-- specific for EGR 425, dont feel like making it general
new_command("PIOCreate",
    function ()
        vim.cmd("!pio project init --ide vim --board swervolf_nexys")
        CreateMakefile()
    end,
    {
        nargs = 0
    }
)


new_command("PIODisassemble",
    function ()
        local filename = string.gsub(vim.api.nvim_buf_get_name(0), vim.loop.cwd(), '')
        filename = filename:match("[^/\\]*.c$")
        filename = string.gsub(filename, '%.c', '%.s')
        local path_to_asm = "./.pio/build/swervolf_nexys/src"

        vim.cmd(string.format("vs|view %s/%s", path_to_asm, filename))
        vim.keymap.set('n', 'q', function() vim.cmd("bd!") end, { buffer = true })   -- just click q to leave that buffer :D
    end,
    {
        nargs = 0
    }
)
