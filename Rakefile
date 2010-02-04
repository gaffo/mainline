require 'rubygems'
gem 'hoe', '>= 2.1.0'
require 'hoe'
require 'fileutils'
require './lib/mainline'

Hoe.plugin :newgem

# Generate all the Rake tasks
# Run 'rake -T' to see list of generated tasks (from gem root directory)
$hoe = Hoe.spec 'mainline' do
  self.developer 'Mike Gaffney', 'mike@gaffney.fake.com'
  self.developer 'Dr Nic Williams', 'drnicwilliams@gmail.com'
  self.extra_deps << ['rack']
end

require 'newgem/tasks'
Dir['tasks/**/*.rake'].each { |t| load t }
