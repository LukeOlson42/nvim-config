-- this will be used to interface with PlatformIO eventually

local new_command = vim.api.nvim_create_user_command

local function CreateMakefile()
    local MakefileData =
"# Uncomment lines below if you have problems with $PATH \
#SHELL := /bin/bash \
#PATH := /usr/local/bin:$(PATH) \
\
all:\
\tpio -f -c vim run\
\
upload:\
\tpio -f -c vim run --target upload\
\
clean:\
\tpio -f -c vim run --target clean\
\
bitstream:\
\tpio -f -c vim run --target program_fpga\
    "
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
        local path_to_asm = ".pio/build/swervolf_nexys/firmware.dis"
        vim.cmd(string.format("vs|view %s", path_to_asm))
        vim.keymap.set('n', 'q', function() vim.cmd("bd!") end, { buffer = true })   -- just click q to leave that buffer :D
    end,
    {
        nargs = 0
    }
)
