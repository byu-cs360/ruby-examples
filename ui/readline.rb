#! /usr/bin/env ruby

# This program is licensed under the GPL; see LICENSE for details.

# Example showing GNU readline parsing in a command-line interface.
# The GNU readline supports some basic Emacs editing commands.  Among
# the commands the interface supports:
#
#   Control-p or up-arrow : scroll up through command history
#   Control-n or down-arrow : scroll up through command history
#   Control-a or control-left-arrow: go to beginning of line
#   Control-e or control-right-arrow: go to end of line
#   Control-b or left-arrow: move back one character
#   Control-f or right-arrow: move forward one character
#   Control-u: erase command line
#   Control-k: cut command line and place in a rotating buffer
#   Control-y: yank the first item from the cut buffer
#   Esc-y: rotate through the cut buffer (after a Control-y only)
#
# End input at the command line using Control-d.

require 'readline'

while a = Readline.readline("> ",true)
  puts a
end

