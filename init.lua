require("jack")

-- Function to save screenshot from clipboard to Markdown file directory with user prompt
function save_screenshot_to_md()
    local image_directory = 'images'  -- Directory relative to your Markdown file
    local md_file_path = vim.fn.expand('%:p')  -- Current Markdown file path

    -- Prompt for the image filename
    local image_filename = vim.fn.input('Enter image filename (without extension): ')

    if image_filename == '' then
        print('No filename entered. Aborting.')
        return
    end

    -- Construct full paths
    local temp_file = os.getenv('TEMP') .. '\\screenshot.png'
    local target_file = image_directory .. '\\' .. image_filename .. '.png'

    -- Copy clipboard contents to a temporary file
    local command = ''
    if vim.fn.has('win32') == 1 then
        command = 'powershell.exe -command "Add-Type -AssemblyName System.Windows.Forms; $image = [System.Windows.Forms.Clipboard]::GetImage(); if ($image) { $image.Save(\'' .. temp_file .. '\', [System.Drawing.Imaging.ImageFormat]::Png); }"'
    elseif vim.fn.has('mac') == 1 then
        command = 'pbpaste > /tmp/screenshot.png'
    elseif vim.fn.has('unix') == 1 then
        command = 'xclip -selection clipboard -t image/png -o > /tmp/screenshot.png'
    else
        print("Unsupported system for clipboard access")
        return
    end
    os.execute(command)

    -- Move the temporary file to the desired directory with the specified filename
    local move_command = string.format('move "%s" "%s"', temp_file, target_file)
    os.execute(move_command)

    -- Append Markdown syntax to the Markdown file
    local markdown_line = string.format('![Screenshot](%s)', target_file)
    vim.api.nvim_buf_set_lines(0, -1, -1, false, {markdown_line})
end





-- Example key mapping (replace with your preferred key combination)
vim.api.nvim_set_keymap('n', '<leader>s', ':lua save_screenshot_to_md()<CR>', {noremap = true, silent = true})
