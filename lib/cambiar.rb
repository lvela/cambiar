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
      @lexed =  Ripper.lex(File.read(opts[:filename]))
    end

    def substitute
      substitute_lexed

      rewrite_file
    end

  private
    def substitute_lexed
      # TODO: shouldn't be dependent on arg position
      s, from, to = ARGV[1].split '/'
      lexed.each do |x| 
        x[2].sub!(/#{from}/, to) if substitute?(x[1])
      end
    end

    def rewrite_file
      File.open('test.rb', 'w') do |file|
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
