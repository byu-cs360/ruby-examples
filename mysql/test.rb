#! /usr/bin/env ruby

# This program is licensed under the GPL; see LICENSE for details.

# test script using the Ruby MySQL module

require 'highline/import'
require "mysql.so"

host = 'ilab.cs.byu.edu'
user = 'zappala'
db = 'winestore'

port = 3306

prompt = "Password for #{user}: "

def get_password(prompt="Password:", mask='*')
  ask(prompt) { |q| q.echo = mask }
end

passwd = get_password(prompt)

begin
  # connect to the MySQL server
  dbh = Mysql.real_connect(host, user, passwd, db, port)
  # get server version string and display it
  puts "Server version: " + dbh.get_server_info
rescue Mysql::Error => e
  puts "Error code: #{e.errno}"
  puts "Error message: #{e.error}"
  puts "Error SQLSTATE: #{e.sqlstate}" if e.respond_to?("sqlstate")
ensure
  # disconnect from server
  dbh.close if dbh
end
