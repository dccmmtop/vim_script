function! run#run_file()
ruby << EOF
  def run()
    Vim.command(":put =expand('%:p')")
    cb = Vim::Buffer.current
    file_name = cb.line
    Vim.command(":undo")
    Vim.command(":e")
    file_type = file_name[/\.(.+)$/,1]
    exec = "python"
    case file_type
    when "py"
      exec = "python"
    when "rb"
      exec = "ruby"
    when "c"
      exec = "c"
    else
    end
    if exec == "c"
      system("nohup terminator -e 'gcc  #{file_name} -o _main.o && ./_main.o  && read && exit; zsh' > /dev/null 2>&1 ")
    else
      system("nohup terminator -e '#{exec} #{file_name}  && read && exit; zsh' > /dev/null 2>&1 ")
    end
  end
run()
EOF
endfunction
