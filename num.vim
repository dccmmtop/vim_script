" 每行的前面添加序号，根据上一行序号自动递增，若上一行没有序号，则从1开始
function! num#add_num()
ruby << EOF
  def get_current_line()
    count = 0
    cb = Vim::Buffer.current
    line = cb.line
    upline_num = cb.line_number - 1
    if upline_num >= 1 && cb[upline_num] =~ /^\d/
      count = $&.to_i
    end
    cb.line = "#{count + 1}. #{line}"
  end
get_current_line()
EOF
endfunction
