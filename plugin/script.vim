" 设置执行命令为 AddNum
command! -range=% AddNum :<line1>,<line2> cal num#add_num()
" 设置执行快捷键为 <leader>qn
" noremap <leader>qn :cal qiniu#get_picture_url()<cr><CR>
noremap <leader>sm :cal sm_picture#get_picture_url()<cr><Cr>
noremap <leader>cm :cal Erb#erbcomment()<cr><Cr>
