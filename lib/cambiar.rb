$:.unshift "lib"

require 'ripper'
require 'optparse'

require "cambiar/version"
require "cambiar/cli"
#require 'pp'

module Cambiar
  class Cambiar
    attr_reader :opts, :lexed

    def self.substitute(opts)
      new(opts).substitute
    end

    def initialize(opts)
      @opts = opts
    end

    def substitute
      opts[:filenames].each do |filename|
        lexed =  Ripper.lex(File.read(filename))
        substitute_lexed(lexed)
        rewrite_file(lexed, filename)
      end
    end

  private
    def substitute_lexed(lexed)
      s, from, to = opts[:substitution].split '/'
      lexed.each do |x| 
        x[2].sub!(/#{from}/, to) if substitute?(x[1])
      end
    end

    def rewrite_file(lexed, filename)
      File.open(filename, 'w') do |file|
        lexed.each do |i|
          file.write i[2]
        end
      end
    end

    def substitute?(type)
      opts[type]
    end
  end
end
