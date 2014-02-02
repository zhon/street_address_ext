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
    normalize address if address
  end

  def normalize address
    return nil unless address
    address = address.dup
    move_suffix_after_street address
    capitialize 'street', address
    capitialize 'city', address
    remove_period 'prefix', address
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

  def remove_period method, address
    item = address.send method
    if item
      address.send "#{method}=", item.gsub('.','')
    end
  end

  def move_suffix_after_street address
    if address.suffix
      address.street += " #{address.suffix}"
      address.suffix = nil
    end
  end

end
