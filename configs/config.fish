function fish_prompt
  if test $SSH_CONNECTION
    echo -e '\033[1m'$USER'@'$hostname':'(prompt_pwd)' $'
  else
    echo -e '\033[1m'(prompt_pwd)' $'
  end
end

set fish_greeting
set fish_color_command --bold '00E500'
set fish_color_error 'E50004'
set fish_color_param '0073E5'
set fish_color_end 'FFF'
set fish_color_quote '00BFBF'
set fish_color_operator '8000FF'
set fish_color_escape '8000FF'
set fish_color_comment '808080'

function fish_title
  if test $SSH_CONNECTION
    echo $USER'@'$hostname
  else
    echo ''
  end
end

set fish_user_paths /opt/homebrew/bin
set EDITOR 'code'

alias hide='chflags hidden'
alias reveal='chflags nohidden'
alias te='open -a TextEdit'
