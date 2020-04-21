#!/opt/puppetlabs/puppet/bin/ruby
require 'json'

def to_bytes(string)
  md = string.match(/^(?<num>\d+)\s?(?<unit>\w+)?$/)
  md[:num].to_i * 
    case md[:unit].upcase
    when 'KB'
      1024
    when 'MB'
      1024**2
    when 'GB'
      1024**3
    when 'TB'
      1024**4
    when 'PB'
      1024**5
    when 'EB'
      1024**6
    when 'ZB'
      1024**7
    when 'YB'
      1024**8
    else
      1
    end
end

# Grab the parameter for where to look for files
directory = ENV['PT_folder'] || '/tmp'
min_size  = ENV['PT_min_size'] || '1Mb'

# Find files
files = Dir["#{directory}/**/*"]

# Loop over and keep the ones that are over the given size
files.keep_if do |path|
  # Ignore non-files
  if File.file? path
    File.size(path) >= to_bytes(min_size)
  else
    false
  end
end

puts({ 'files' => files }.to_json)