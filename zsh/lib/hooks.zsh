WYH_FIRST_PROMPT=true

add-to-custom-history() {
    if [ "$WYH_FIRST_PROMPT" = true ]; then
        unset WYH_FIRST_PROMPT
        return
    fi

    local _exit_status="$?"
    local _session_id="$$"
    local _last_command="$(fc -ln -1)"

    echo "$(date +%s);$_session_id;$_exit_status;$PWD;$USER;$_last_command" >>"$HOME/.wyh_history"
}

add-zsh-hook precmd add-to-custom-history
