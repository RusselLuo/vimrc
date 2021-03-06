" Calculates the changed portions of lines.  Based closely on diff-highlight
" (included with git) - please note its caveats.
"
" https://github.com/git/git/blob/master/contrib/diff-highlight/DiffHighlight.pm


" Returns a list of intra-line changed regions.
" Each element is a list:
"
"   [
"     line number (1-based),
"     type ('+' or '-'),
"     start column (1-based, inclusive),
"     stop column (1-based, inclusive),
"   ]
"
" Args:
"   hunk_body - list of lines
function! gitgutter#diff_highlight#process(hunk_body)
  " Check whether we have the same number of lines added as removed.
  let [removed, added] = [0, 0]
  for line in a:hunk_body
    if line[0] == '-'
      let removed += 1
    elseif line[0] == '+'
      let added += 1
    endif
  endfor
  if removed != added
    return []
  endif

  let regions = []

  for i in range(removed)
    " pair lines by position
    let rline = a:hunk_body[i]
    let aline = a:hunk_body[i + removed]

    let prefix = s:common_prefix(rline, aline)
    let [rsuffix, asuffix] = s:common_suffix(rline, aline, prefix+1)

    if (prefix != 0 || rsuffix != 0) && prefix+1 < rsuffix
      call add(regions, [i+1, '-', prefix+1+1, rsuffix+1-1])
    endif

    if (prefix != 0 || asuffix != 0) && prefix+1 < asuffix
      call add(regions, [i+1+removed, '+', prefix+1+1, asuffix+1-1])
    endif
  endfor

  return regions
endfunction


" Returns 0-based index of last character of common prefix
" Does not treat leading +/- as different.
"
" a, b - strings
"
function! s:common_prefix(a, b)
  let len = min([len(a:a), len(a:b)])
  " ignore initial +/-
  for i in range(1, len - 1)
    if a:a[i:i] != a:b[i:i]
      return i - 1
    endif
  endfor
  return i
endfunction

if $VIM_GITGUTTER_TEST
  function! gitgutter#diff_highlight#common_prefix(a, b)
    return s:common_prefix(a:a, a:b)
  endfunction
endif


" Returns 0-based indices of start of common suffix
"
" a, b - strings
" start - 0-based index to start from
function! s:common_suffix(a, b, start)
  let [sa, sb] = [len(a:a), len(a:b)]
  while sa >= a:start && sb >= a:start
    if a:a[sa] ==# a:b[sb]
      let sa -= 1
      let sb -= 1
    else
      break
    endif
  endwhile
  return [sa+1, sb+1]
endfunction

if $VIM_GITGUTTER_TEST
  function! gitgutter#diff_highlight#common_suffix(a, b, start)
    return s:common_suffix(a:a, a:b, a:start)
  endfunction
endif
