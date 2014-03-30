require 'ripper'
require 'pp'
require 'sorcerer'

#sexp = Ripper::SexpBuilder.new(File.read(ARGV[0])).parse
lexed =  Ripper.lex(File.read(ARGV[0]))
#pp sexp
#puts Sorcerer.source(sexp, indent: true)

lexed.each do |i|
  print i[2]
end
