#!/usr/bin/env ruby

require 'ripper'
require 'optparse'
require 'pp'


def main
  #r = {identifer: :on_ident, constant: :on_cost} 

  options = getOptions

  lexed =  Ripper.lex(File.read(ARGV[0]))

  s, from, to = ARGV[1].split '/'

  lexed.each do |x| 
    if (options[:identifier] && x[1] == :on_ident) || 
       (options[:constant] && x[1] == :on_const)
        x[2].sub!(/#{from}/, to)
    end
  end

  File.open('test.rb', 'w') do |file|
    lexed.each do |i|
      file.write i[2]
    end
  end
end

def getOptions
  options = {}
  OptionParser.new do |opts|
    opts.banner = "Usage: rip.rb <filename> s/<from>/<to>/"

    opts.on("-i", "--identifier", "Substitute identifers") do |i|
      options[:identifier] = i
    end

    opts.on("-c", "--constant", "Substitute constants") do |c|
      options[:constant] = c
    end
  end.parse!

  options
end

main
