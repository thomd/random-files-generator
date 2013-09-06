export PATH=$(pwd)/../bin:$PATH
export BATS_TEST_TMPDIR=$BATS_TMPDIR/tmp

number_of_files() {
  echo $(find . -type f | wc -l)
}

number_of_folders() {
  echo $(( $(find . -type d | wc -l) - 1 ))
}

setup() {
  [ ! -d $BATS_TEST_TMPDIR ] && mkdir $BATS_TEST_TMPDIR
  cd $BATS_TEST_TMPDIR
}

teardown() {
  rm -r $BATS_TEST_TMPDIR
}
