# watch files.bats for changes
#
# requres watchr gem
#
def run_bats
  system('clear')
  system('bats files.bats')
end

watch('files.bats') { |md| run_bats }
watch('test_helper.bash') { |md| run_bats }

run_bats

# vim:ft=ruby
