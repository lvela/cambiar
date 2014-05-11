$:.unshift "lib"

require 'ripper'
require 'optparse'

require "cambiar/version"
require "cambiar/cli"
#require 'pp'

module Cambiar
  extend self

  def substitute(opts = {})
    lexed =  Ripper.lex(File.read(opts[:filename]))

    s, from, to = ARGV[1].split '/'

    lexed.each do |x| 
      if (opts[:identifier] && x[1] == :on_ident) || 
         (opts[:constant] && x[1] == :on_const)
          x[2].sub!(/#{from}/, to)
      end
    end

    File.open('test.rb', 'w') do |file|
      lexed.each do |i|
        file.write i[2]
      end
    end
  end
end
