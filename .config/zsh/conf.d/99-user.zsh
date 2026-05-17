# try to avoid the 'zsh: no matches found...'
setopt nonomatch

# alert me if something failed
setopt printexitvalue

# Some magic from gentoo wiki
#
# See: <https://wiki.gentoo.org/wiki/Zsh/Guide#Miscellaneous_settings>.
setopt autocd
setopt extendedglob

## Docker
# dcleanup(){
#     docker rm -v $(docker ps --filter status=exited -q 2>/dev/null) 2>/dev/null
#     docker rmi $(docker images --filter dangling=true -q 2>/dev/null) 2>/dev/null
# }
