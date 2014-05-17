module Cambiar
  class CLI
    def start
      Cambiar.substitute(opts)
    end

    def opts
      @options ||= begin
        options = {}
        OptionParser.new do |opts|
          opts.banner = 'Usage: cambiar -[i|c] "s/<from>/<to>/" [file ...]'

          opts.on("-i", "--on_ident", "Substitute identifers") do |i|
            options[:on_ident] = i
          end

          opts.on("-c", "--on_const", "Substitute constants") do |c|
            options[:on_const] = c
          end
        end.parse!
        options[:substitution] = ARGV.shift
        options[:filenames] = filenames
        options
       end
    end

    def filenames
      filenames = []
      until ARGV.empty? do
        location = ARGV.shift
        filenames << (File.directory?(location) ? Dir.glob("#{location}*.rb") : location)
      end
      filenames.flatten
    end
  end
end
