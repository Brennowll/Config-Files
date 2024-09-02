if status is-interactive
    ##  Alias

    alias grep='grep --color=auto'
    alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"

    ## Interactive initializers

    # zoxide
    zoxide init fish | source

    # pyenv
    pyenv init - | source

    ## Packages configs

    # fzf preview
    set show_file_or_dir_preview "if test -d {}; eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; end"

    # fzf ambient variables
    set -x FZF_DEFAULT_COMMAND "fd --hidden --strip-cwd-prefix --exclude .git"
    set -x FZF_CTRL_T_OPTS "--preview '$show_file_or_dir_preview'"
    set -x FZF_ALT_C_OPTS "--preview 'eza --tree --color=always {} | head -200'"

    # fzf functions
    function _fzf_compgen_path
        fd --hidden --exclude .git . $argv
    end

    function _fzf_compgen_dir
        fd --type=d --hidden --exclude .git . $argv
    end

    # fzf advanced personalization functions
    function _fzf_comprun
        switch $argv[1]
            case cd
                fzf --preview 'eza --tree --color=always {} | head -200' $argv[2..-1]
                ;;
            case export or unset
                fzf --preview "eval 'echo \$'{}" $argv[2..-1]
                ;;
            case ssh
                fzf --preview 'dig {}' $argv[2..-1]
                ;;
            case '*'
                fzf --preview "bat -n --color=always --line-range :500 {}" $argv[2..-1]
                ;;
        end
    end

    # fzf theme
    set fg "#CBE0F0"
    set bg "#011628"
    set bg_highlight "#143652"
    set purple "#B388FF"
    set blue "#06BCE4"
    set cyan "#2CF9ED"

    set -x FZF_DEFAULT_OPTS "--color=fg:$fg,bg:$bg,hl:$purple,fg+:$fg,bg+:$bg_highlight,hl+:$purple,info:$blue,prompt:$cyan,pointer:$cyan,marker:$cyan,spinner:$cyan,header:$cyan"
 
    # bat theme
    set -x BAT_THEME tokyonight_night
end

## Not-interactive Initializers

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# brew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/brenno/temp/google-cloud-sdk/path.fish.inc' ]; . '/home/brenno/temp/google-cloud-sdk/path.fish.inc'; end
