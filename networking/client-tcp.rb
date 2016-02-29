#! /usr/bin/env ruby

# This program is licensed under the GPL; see LICENSE for details.

# A simple echo client

require 'optparse'
require 'socket'

# parse arguments

options = {}
opt = OptionParser.new do |opts|
  opts.banner = "Usage: client-socket.rb [options]"

  opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
    options[:verbose] = v
  end
  opts.on("-s", "--server SERVER","Server to connect to") do |s|
    options[:server] = s
  end
  opts.on("-p", "--port PORT","Port to connect to") do |p|
    options[:port] = p
  end
end

begin
  opt.parse!
rescue
  puts opt.banner
  puts opt.summarize
  exit
end

unless options[:port] and options[:server]
  puts opt.banner,opt.summarize
  exit
end

# configure server
host = options[:server]
port = options[:port]
size = 1000

# connect to server
begin
  client = TCPSocket.new(host,port)
  while data = gets
    client.send(data,0)
    back = client.gets
    break if back.nil?
    puts back
  end
rescue => reason
  puts "Connection failed: #{reason}"
ensure
  client.close
end
