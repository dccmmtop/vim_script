function! Erb#erbcomment() range
ruby << EOF
  def get_current_line()
    # 将结果保存到环境变量中
    Vim.command("let $R= (a:firstline)")
    Vim.command("let $L= (a:lastline)")
    # normal! 会忽略用户的映射
    Vim.command("normal! #{ENV['R']}ggO<!--")
    Vim.command("normal! #{ENV['L'].to_i + 1}ggo-->")
  end
get_current_line()
EOF
endfunction
