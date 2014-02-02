# StreetAddressExt

``StreetAddresExt`` is a thin wrapper around gem [street-address](https://github.com/derrek/street-address)

In fact, parse returns a ``StreetAddress::US::Address``

with

 - state and postal codes removed
 - street and city capitalized
 - suffix in correct position see [this issue](https://github.com/derrek/street-address/issues/9)



## Installation

Add this line to your application's ``Gemfile``:

```ruby
gem 'street_address_ext'
```

And then execute:

```bash
$ bundle
```

Or install it yourself as:

```bash
$ gem install street_address_ext
```


## Usage

```ruby
require 'street_address_ext'

address_string = "84 Beacon St., Boston MA"
StreetAddressExt.parse(address_string).to_s #=> "84 Beacon St, Boston"
```

## Dependencies

[StreetAddress](https://github.com/derrek/street-address)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

