function! sm_picture#get_picture_url()
ruby << EOF
class SM
  def initialize
    @buffer = Vim::Buffer.current
  end

  def get_current_line
    s = @buffer.line       # gets the current line
    name = s.split("/").last
    real_link = `sm_picture #{s}`
    real_link = real_link.split(/\n/).last
    Vim::Buffer.current.line = "![#{name}](#{real_link})"     # sets the current line number
  end
end
gem = SM.new
gem.get_current_line
EOF
endfunction
