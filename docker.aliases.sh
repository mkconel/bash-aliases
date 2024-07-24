alias d="docker"
function da() {
    docker attach ${1:-app}
}
alias db="docker build"
alias dbn="docker build --no-cache"
function di() {
    docker inspect ${1:-app}
}
function dl() {
    docker logs ${1:-app}
}
function dlt() {
    docker logs -n 100 ${1:-app}
}
function dlf() {
    docker logs -f ${1:-app}
}
function dlft() {
    docker logs -n 100 -f ${1:-app}
}
function dsr() {
    docker restart ${1:-app}
}
function dsa() {
    docker start ${1:-app}
}
function dso() {
    docker stop ${1:-app}
}
alias dt="docker tag"
alias dr="docker run"
function de() {
    docker exec -it ${1:-app} ${2:-bash}
}
alias dp="docker ps -a"