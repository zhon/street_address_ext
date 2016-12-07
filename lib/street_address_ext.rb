require "street_address_ext/version"

require 'street_address'

module StreetAddress
  class US
    class Address

      def line1(s = "")
        if intersection?
          s += prefix + " " unless prefix.nil?
          s += street
          s += " " + street_type unless street_type.nil?
          s += " " + suffix unless suffix.nil?
          s += " and"
          s += " " + prefix2 unless prefix2.nil?
          s += " " + street2
          s += " " + street_type2 unless street_type2.nil?
          s += " " + suffix2 unless suffix2.nil?
        else
          s += number
          s += " " + prefix unless prefix.nil?
          s += " " + street unless street.nil?
          s += " " + street_type unless street_type.nil?
          s += " " + suffix unless suffix.nil?
          if( !unit_prefix.nil? && !unit.nil? )
            s += " " + unit_prefix
            s += " " + unit
          elsif( unit_prefix.nil? && !unit.nil? )
            s += " #" + unit
          end
        end

        return s
      end

    end
  end
end

module StreetAddressExt
  extend self

  def parse text
    text = strip_country text.trim
    address = StreetAddress::US.parse(text)
    unless address
      address = StreetAddress::US.parse("#{text},UT")
      address.state = nil if address
    end
    normalize address if address
  end

  def strip_country text
    return text.sub(/(?:(?:United States)|USA)$/, '')
  end

  def normalize address
    return nil unless address
    address = address.dup
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

end
