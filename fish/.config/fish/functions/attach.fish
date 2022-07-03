function attach --wraps='tmux a -t work; tmux new -s work' --description 'alias attach tmux a -t work; tmux new -s work'
  tmux a -t work; tmux new -s work $argv; 
end
