# MySQL

Example Ruby scripts showing how to use the MySQL/Ruby module to
access a MySQL database.

For more information on this interface, see:

http://tmtm.org/en/mysql/ruby/
http://www.kitebird.com/articles/ruby-mysql.html

To use this module, you need to install it using the instructions
found below.

## Contents

1) test.rb - Test whether you can connect to your database using the
MySQL/Ruby module.

Note: You need to install the Highline GEM.  See the above instructions.

This gem allows you to read a password from standard input, while printing
a "*" for each character typed.

2) query.rb - Example showing how to issue a query

## Installation

If you run Ubuntu or some other distribution on your own laptop or
desktop, you should still install Gems manually, rather than through
your package manager. Otherwise, Gems will end up fighting your
package manager since it will try to update software by itself.

Follow these instructions:

1) Install ruby, rubygems, rdoc, and gnuplot

```
sudo apt-get install ruby rubygems rdoc gnuplot
```

2) Edit a file in your home directory called ~/.bashrc and add these lines:

```
export RUBYOPT=rubygems
```

RUBYOPT preloads the gems software so that you don't have to type an
extra require line in each program that uses a gem.

If you want these settings to take effect immediately, then start a
new shell or type:

```
source ~/.bashrc
```

3) Install the gems you want to use

```
sudo gem install gnuplot
sudo gem install highline
sudo gem install statarray
sudo gem install rails
sudo gem install sqlite3-ruby
```

4) Install the MySQL/Ruby Module

The MySQL/Ruby module allows you to access a MySQL database from a
Ruby script.

```
sudo apt-get install libmysql-ruby
```

