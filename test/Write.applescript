on write_to_file(this_data, target_file, append_data) -- (string, file path as string, boolean)
    try
        set the target_file to the target_file as text
        set the open_target_file to ¬
            open for access file target_file with write permission
        if append_data is false then ¬
            set eof of the open_target_file to 0
        write this_data to the open_target_file starting at eof
        close access the open_target_file
        return true
    on error
        try
            close access file target_file
        end try
        return false
    end try
end write_to_file

my WriteLog("Once upon a time in Silicon Valley...")

on WriteLog(the_text)
    set this_story to the_text
    set this_file to "~/Desktop/test.apple" as text
    my write_to_file(this_story, this_file, true)
end WriteLog