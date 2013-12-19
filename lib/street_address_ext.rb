require "street_address_ext/version"

require 'street_address'

module StreetAddressExt
  extend self

  def parse text
    address = StreetAddress::US.parse(text)
    unless address
      address = StreetAddress::US.parse("#{text},UT")
      address.state = nil if address
    end
    address
  end

  def normalize address
    address = address.dup
    capitialize 'street', address
    capitialize 'city', address
    address.state = nil
    address.postal_code = nil
    address.postal_code_ext = nil
    address
  end

  def capitialize method, address
    address.send(method+'=', address.send(method).split(/\s+/).map { |item|
      item.capitalize
    }.join(' '))
  end


end
