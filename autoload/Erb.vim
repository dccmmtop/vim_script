" 每行的前面添加序号，根据上一行序号自动递增，若上一行没有序号，则从1开始
function! Erb#erbcomment() range
ruby << EOF
  def get_current_line()
  Vim.command("let $R= (a:firstline)")
  Vim.command("let $L= (a:lastline)")
  Vim.command("normal #{ENV['R']}ggO<!--jk")
  Vim.command("normal #{ENV['L'].to_i + 1}ggo-->jk")
  end
get_current_line()
EOF
endfunction
