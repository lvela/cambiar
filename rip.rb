#!/usr/bin/env ruby

require 'ripper'
require 'pp'

lexed =  Ripper.lex(File.read(ARGV[0]))

s, from, to = ARGV[1].split '/'

lexed.each do |x| 
  if x[1] == :on_ident
    x[2].sub!(/#{from}/, to)
  end
end

File.open('test.rb', 'w') do |file|
  lexed.each do |i|
    file.write i[2]
  end
end
