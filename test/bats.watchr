# watch files.bats for changes
#
# gem install watchr
#
# https://github.com/ervandew/screen
#    :map <C-k> :ScreenShell! watchr test/bats.watchr<CR>
#    :map <C-l> :ScreenQuit<CR>
#
def run_bats
  system('clear')
  system('bats test/files.bats')
end

watch('bin/files') { |md| run_bats }
watch('test/files.bats') { |md| run_bats }
watch('test/test_helper.bash') { |md| run_bats }

run_bats

# vim:ft=ruby
