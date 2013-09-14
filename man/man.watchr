# watch files.1.md for changes
#
# requres watchr gem
#
def run_markedman
  system('clear')
  system('marked-man --version=0.1 man/files.1.md > man/files.1')
  system('PAGER="/usr/bin/less -E" man ./man/files.1')
end

watch('man/files.1.md') { |md| run_markedman }

run_markedman

# vim:ft=ruby
