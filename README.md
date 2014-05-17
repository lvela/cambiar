# Cambiar

It's easy to accidently change something with find/replace that you didn't mean to change. Cambiar makes find/replace safer by replacing only certain types using the Ruby AST.

## Installation

Add this line to your application's Gemfile:

    gem 'cambiar'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cambiar

## Usage


## Examples

```
cambiar -i "s/reader/fast_reader/" test.rb
```

before
``` ruby
class Reader
  READER = 'reader'

  def my_fast_reader
    puts "Reader reader"
  end 
end
```

after
``` ruby
class Reader
  READER = 'reader'

  def my_reader
    puts "Reader reader"
  end 
end
```

```
cambiar -c "s/READER/FAST_READER/" test.rb
```

before
``` ruby
class Reader
  READER = 'reader'

  def my_reader
    puts "READER Reader reader"
  end
end
```

after
``` ruby
class Reader
  FAST_READER = 'reader'

  def my_reader
    puts "READER Reader reader"
  end 
end
```

## Contributing

1. Fork it ( http://github.com/<my-github-username>/cambiar/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
