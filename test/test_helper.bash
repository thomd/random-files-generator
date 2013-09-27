export PATH=$(pwd)/bin:$PATH
export BATS_TEST_TMPDIR=$BATS_TMPDIR/tmp

setup() {
  [ ! -d $BATS_TEST_TMPDIR ] && mkdir $BATS_TEST_TMPDIR
  cd $BATS_TEST_TMPDIR
}

teardown() {
  rm -r $BATS_TEST_TMPDIR
}

number_of_lines() {
  echo $(find . -type f -not -name ".files" | xargs cat | wc -l)
}

number_of_files() {
  local path=${1:-.}
  local name=${2:-*}
  echo $(find $path -type f -name "$name" -not -name ".files" | wc -l)
}

number_of_folders() {
  echo $(( $(find . -type d | wc -l) - 1 ))
}

