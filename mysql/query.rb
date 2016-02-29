#! /usr/bin/env ruby

# This program is licensed under the GPL; see LICENSE for details.

# test script using the Ruby MySQL module

require 'highline/import'
require "mysql"

host = 'ilab.cs.byu.edu'
user = 'zappala'
db = 'winestore'

prompt = "Password for #{user}: "

def get_password(prompt="Password:", mask='*')
  ask(prompt) { |q| q.echo = mask }
end

passwd = get_password(prompt)

begin
  # connect to the MySQL server
  dbh = Mysql.real_connect(host, user, passwd, db)
  # issue query
  results = dbh.query("SELECT surname, firstname, count(order_id)" +
                      " FROM customer NATURAL JOIN orders" +
                      " GROUP BY customer.cust_id" +
                      " HAVING count(order_id) >= 6" +
                      " ORDER BY surname, firstname;")
  # loop through results
  results.each do |row|
    puts "#{row[0]}, #{row[1]}: #{row[2]}"
  end
  puts "Number of rows returned: #{results.num_rows}"

  results.free
rescue Mysql::Error => e
  puts "Error code: #{e.errno}"
  puts "Error message: #{e.error}"
  puts "Error SQLSTATE: #{e.sqlstate}" if e.respond_to?("sqlstate")
ensure
  # disconnect from server
  dbh.close if dbh
end
