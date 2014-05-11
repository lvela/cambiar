module Cambiar
  class CLI
    def start
      Cambiar.substitute(opts)
    end

    def opts
      @options ||= begin
        options = {}
        options[:filename] = ARGV[0]
        OptionParser.new do |opts|
          opts.banner = "Usage: cambiar -[i|c] <filename> s/<from>/<to>/"

          opts.on("-i", "--identifier", "Substitute identifers") do |i|
            options[:identifier] = i
          end

          opts.on("-c", "--constant", "Substitute constants") do |c|
            options[:constant] = c
          end
        end.parse!
        options
       end
    end
  end
end
