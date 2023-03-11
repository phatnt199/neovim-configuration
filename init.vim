set runtimepath^=/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
syntax enable

lua << EOF
  require('settings.index')
EOF
