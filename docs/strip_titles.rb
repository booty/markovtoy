#!/usr/bin/env ruby
require "titleize"

begin
  while true do
    poop = ARGF.readline
    puts poop unless (poop.length > 1) && (poop.strip == poop.strip.titleize)
  end
rescue EOFError
end