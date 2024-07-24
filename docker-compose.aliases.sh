CBA_DC_PREFIX="docker compose"
alias dc="$CBA_DC_PREFIX"
function dca() {
    $CBA_DC_PREFIX attach ${1:-app}
}
alias dcb="$CBA_DC_PREFIX build"
alias dcbn="$CBA_DC_PREFIX build --no-cache"
alias dcd="$CBA_DC_PREFIX down"
function dce() {
    $CBA_DC_PREFIX exec ${1:-app} ${2:-bash}
}
alias dcl="$CBA_DC_PREFIX logs"
alias dclt="$CBA_DC_PREFIX logs -n 100"
alias dclf="$CBA_DC_PREFIX logs -f"
alias dclft="$CBA_DC_PREFIX logs -f -n 100"
alias dcp="$CBA_DC_PREFIX ps -a"
alias dcsr="$CBA_DC_PREFIX restart"
alias dcsa="$CBA_DC_PREFIX start"
alias dcso="$CBA_DC_PREFIX stop"
alias dcu="$CBA_DC_PREFIX up -d"
alias dcup="$CBA_DC_PREFIX up -d --pull always"
