vim.api.nvim_create_user_command("Rmbufs",
    function()
        print("Clearing background buffers...")
        vim.cmd("%bd|e#|bd#")
    end,
{})
