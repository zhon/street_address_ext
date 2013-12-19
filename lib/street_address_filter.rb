require "street_address_filter/version"

require 'street_address'

module StreetAddressFilter

  class Parser

    def initialize *excluded_address
      @excluded_address = []
      @excluded_address = excluded_address.map do |item|
        parse item
      end
    end

    def parse text
      address = StreetAddress::US.parse(text)
      unless address
        address = StreetAddress::US.parse("#{text},UT")
        address.state = nil if address
      end
      return nil if @excluded_address.include? address.to_s
      address.to_s
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

end
