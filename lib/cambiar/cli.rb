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

          opts.on("-i", "--on_ident", "Substitute identifers") do |i|
            options[:on_ident] = i
          end

          opts.on("-c", "--on_const", "Substitute constants") do |c|
            options[:on_const] = c
          end
        end.parse!
        options
       end
    end
  end
end
