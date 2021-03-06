# Fixer::Client

[![Build Status](https://travis-ci.org/grzegorzblaszczyk/fixerio-client.svg?branch=master)](https://travis-ci.org/grzegorzblaszczyk/fixerio-client)
[![Maintainability](https://api.codeclimate.com/v1/badges/beca7c860bad3aaed7ef/maintainability)](https://codeclimate.com/github/grzegorzblaszczyk/fixerio-client/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/beca7c860bad3aaed7ef/test_coverage)](https://codeclimate.com/github/grzegorzblaszczyk/fixerio-client/test_coverage)

Get latest or historic currency rates for base EUR from api.fixer.io

To experiment with our code, run `bin/console` for an interactive prompt.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fixerio_client'
```

And then execute:

```bash
bundle
```

Or install it yourself as:

```bash
gem install fixerio_client
```

## Usage

```ruby
fixer = Fixer::Client.latest
results = fixer.fetch(["USD", "GBP"])
```

It gives result like:

```ruby
=> {"success"=>true, "timestamp"=>1538261947, "base"=>"EUR", "date"=>"2018-09-29", "rates"=>{"GBP"=>0.891903, "USD"=>1.162149}}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Testing

By default all requests to (https://api.fixer.io) are stubbed and VCR gem is used to replay HTTP responses.
If you want to send real requests, please copy `config/fixerio_client.yml.sample` to `config/fixerio_client.yml` and put your real API key there.
Then run:

```bash
VCR_OFF=1 rspec spec
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/grzegorzblaszczyk/fixerio-client. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Fixer::Client project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/grzegorzblaszczyk/fixerio-client/blob/master/CODE_OF_CONDUCT.md).
