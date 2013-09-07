# watch files.bats for changes
#
# requres watchr gem
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
