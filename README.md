# StripComments [![Gem Version](https://badge.fury.io/rb/strip_comments.svg)](https://badge.fury.io/rb/strip_comments)

Uses regular expressions to strip things that look like comments from strings.

**Supported extensions:** css, glsl, html, properties, yml

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'strip_comments'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install strip_comments

## Usage

```rb
require 'strip_comments'
input = File.open("your.yml").read
stripped = StripComments::strip_yaml(input)
```

You can use this to, for example, rewrite all source files in a folder:

```rb
require "strip_comments"

Dir.glob(File.join(File.dirname(__FILE__), "..", "**", "*.{css,html,yml,properties,glsl}")).each do |filename|
  extension = filename.split(".").last
  input = File.open(filename).read
  output = StripComments::strip(extension, input)

  File.write(filename, output)
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To release a new version, update the version number in `version.rb`, and then push into `release` branch. GitHub actions will automatically publish the new gem version to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/soundasleep/strip_comments.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/soundasleep/strip_comments/blob/main/CODE_OF_CONDUCT.md).
