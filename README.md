# ConfigurationParser

This library parses configuration that looks like this:

```ruby
set :name, "Gabe"
set :posts_per_page, 3
configure :blog do
  set :root, "/blog"
end
```

...which is parsed into this hash:

```ruby
{
  name: "Gabe",
  posts_per_page: 3,
  blog: {
    root: "/blog"
  }
}
```

You can nest configuration arbitrarily deep, for example:

```ruby
configure :blog do
  configure :second_level do
    configure :inception do
      set :christopher, "Nolan"
    end
  end
end

# becomes

{
  blog: {
    second_level: {
      inception: {
        christopher: "Nolan"
      }
    }
  }
}
```

## Installation

Add this line to your application's Gemfile:

    gem 'configuration_parser'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install configuration_parser

## Usage

The `ConfigurationParser.parse` method is the only method you need. It takes a
string:

```ruby
ConfigurationParser.parse("set :posts_per_page, 3")
```

You can parse files:

```ruby
ConfigurationParser.parse(File.read('my_config_file'))
```

## Contributing

1. Fork it ( http://github.com/<my-github-username>/configuration_parser/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
