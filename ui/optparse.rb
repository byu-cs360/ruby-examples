#! /usr/bin/env ruby

# This program is licensed under the GPL; see LICENSE for details.

# Example showing option parsing.  Test the following cases:
#
#   optparse.rb -h
#   optparse.rb --help
#   optparse.rb -a test
#   optparse.rb --argument test
#   optparse.rb -a test -v
#   optparse.rb -a test --verbose
#   optparse.rb -a test --no-verbose

require 'optparse'

# setup option parser to store options in a hash based on symbols

options = {}
options[:verbose] = false

opt = OptionParser.new do |opts|
  opts.banner = "Usage: optparse.rb [options]"

  # true/false option
  opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
    options[:verbose] = v
  end

  # option with an argument
  opts.on("-a", "--argument VALUE","Argument value") do |a|
    options[:argument] = a
  end
end

# parse options and print a message if options aren't use properly
begin
  opt.parse!
rescue
  puts opt.banner
  puts opt.summarize
  exit
end

# check for options that this program considers mandatory
unless options[:argument]
  puts opt.banner,opt.summarize
  exit
end

# print arguments
puts options[:verbose]
puts options[:argument]
