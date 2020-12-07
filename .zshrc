function source_all() {
  local uname=`uname | awk '{print tolower($0)}'`
  local dir=$1
  for f in $(ls -1 $dir/* | egrep "\.(sh|$uname)$"); do
    . $f
  done
}

source_all ~/.zshrc.d
