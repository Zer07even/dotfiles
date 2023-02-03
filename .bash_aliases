# enable system update and cleanup alias
alias system-update='sudo apt update && sudo apt upgrade && sudo apt full-upgrade && sudo apt auto-remove && sudo apt autoclean && sudo apt clean'

# bring all files from nested folders to the current location
alias bringalltoroot='find . -mindepth 2 -type f -print -exec mv {} . \;'

# delete all emptyfolders
alias deleteemptys='find . -empty -type d -delete'
