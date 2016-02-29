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
  server = Socket.new(Socket::AF_INET,Socket::SOCK_STREAM,0)
  server.setsockopt(Socket::SOL_SOCKET,Socket::SO_REUSEADDR,true)
  address = Socket.pack_sockaddr_in(port,host)
  server.bind(address)
  server.listen(5)
rescue => reason
  puts "Can't create server: " + reason
  exit
end

# handle clients
begin
  while true
    client,address = server.accept
    Thread.start(client) do |cs|
      begin
        while (data = cs.recv(size))
          break if data == ""
          cs.puts data
        end
      rescue SocketError => reason
        # silently absorb the error
      ensure
        cs.close if cs
      end
    end
  end
rescue SocketError => reason
  puts "Server socket has failed: #{reason}"
rescue Interrupt
  puts "Closing down ... OK"
ensure
  server.close
end
