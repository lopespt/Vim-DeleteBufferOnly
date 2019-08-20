function! DeleteBufferMaintainWindow(b,a)
  let l:bufname=bufname('%')
  if(a:a != '')
    execute (':b '.a:a)
  endif
  if(getbufinfo(l:bufname)[0].changed == 1 && a:b != "!")
    echohl WarningMsg
    echo "Buffer changed. Add ! to force deletion"
    echohl None
    return
  endif
  bp
  sp
  bn
  bd!
endfunction
comm! -complete=buffer -addr=buffers -nargs=? -bang Bd  call DeleteBufferMaintainWindow(<q-bang>,<q-args>)
