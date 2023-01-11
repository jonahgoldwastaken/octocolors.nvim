# Color palette
set -l foreground c9d1d9
set -l selection 0c2d6b
set -l comment 8b949e
set -l red ff7b72
set -l green 3fb950
set -l blue 58a6ff
set -l lightBlue a5d6ff

# Syntax highlighting
set -g fish_color_normal $foreground
set -g fish_color_command $blue
set -g fish_color_keyword $red
set -g fish_color_quote $lightBlue
set -g fish_color_redirection $red
set -g fish_color_end $red
set -g fish_color_error $red
set -g fish_color_param $foreground
set -g fish_color_valid_path $blue
set -g fish_color_option $blue
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $red
set -g fish_color_escape $green
set -g fish_color_autosuggestion $comment

# Pager highlighting
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $blue --bold
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment
set -g fish_pager_color_selected_background --background=$selection
