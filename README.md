# motion-qlcommonmark

RubyMotion wrapper for the QuickLook generator [QLCommonMark](https://github.com/digitalmoksha/QLCommonMark)

## Installation

Add this line to your application's Gemfile:

    gem 'motion-qlcommonmark'

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install motion-qlcommonmark

## Usage

When you do a build, the QuickLook generator is automatically installed, embedded into your app, and code signed with current signing certificate.

If you don't wish for the generator to be signed, you can add this to your `Rakefile`

```
Motion::Project::App.setup do |app|
  app.qlcommonmark do |config|
    config.signing_enabled = false
  end
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
