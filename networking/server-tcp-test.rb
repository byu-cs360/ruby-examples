#! /usr/bin/env ruby

# This program is licensed under the GPL; see LICENSE for details.

# A simple echo server

require 'optparse'
require 'socket'

# parse arguments

options = {}
opt = OptionParser.new do |opts|
  opts.banner = "Usage: server-socket.rb [options]"

  opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
    options[:verbose] = v
  end
  opts.on("-p", "--port PORT","Port to listen on") do |p|
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

unless options[:port]
  puts opt.banner,opt.summarize
  exit
end

# configure server
host = ''
port = options[:port]
size = 1000

# create server
begin
  server = TCPServer.new(host,port)
rescue => reason
  puts "Can't create server: " + reason
  exit
end

# handle clients
begin
  while true
    Thread.start(server.accept) do |session|
      begin
        puts "Got client"
        while true
          data = session.gets
          break if data.nil?
          session.puts data
        end
        puts "client left"
      rescue SocketError => reason
        # silently absorb the error
        puts reason
      ensure
        session.close if session
      end
    end
  end
rescue SocketError => reason
  puts "Server socket has failed: #{reason}"
rescue Interrupt
  puts "Closing down ... OK"
end
