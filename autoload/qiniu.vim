function! qiniu#get_picture_url()
ruby << EOF
class Qiniu
  def initialize
    @buffer = Vim::Buffer.current
  end

  def get_current_line
    s = @buffer.line       # gets the current line
    real_link = `qiniu #{s}`
    real_link = real_link.split(/\n/).last
    Vim::Buffer.current.line = "![](#{real_link})"     # sets the current line number
  end
end
gem = Qiniu.new
gem.get_current_line
EOF
endfunction
