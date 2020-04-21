#!/opt/puppetlabs/puppet/bin/ruby
require 'json'

file  = ENV['PT_file']

# Try to delete the file and catch any errors
begin
  files_deleted = File.delete(file)
rescue StandardError => e
  files_deleted = 0
  message       = e.inspect
end

# Format the result
result = {
  'files_deleted' => files_deleted
}
result['message'] = message if message

# Print the output
puts result.to_json
