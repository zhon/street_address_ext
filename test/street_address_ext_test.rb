require_relative 'helper'

require 'street_address_ext'

include StreetAddressExt
describe StreetAddressExt do

  describe 'parse' do

    it 'returns address' do
      text = '1111 N 250 W, Harrisville, UT'
      @parser.parse(text).class.must_equal StreetAddress::US::Address
    end

    it 'handles address missing state' do
      text = '1111 N 250 W, Harrisville'
      parse(text).to_s.must_equal text
    end

    #it 'handles aka first address is valid' do
      #skip
      #text = '2286 West 1445 North aka 1459 North 2275 West, Clinton, UT'
    #end

    #it 'handles aka second address is valid' do
      #skip
      #text = '263 3050 West N aka 263 North 3050 West, Layton, UT'
    #end

    #it 'handles mutiple addresses' do
      #skip
      #text = '676 and 678 31st Street Ogden Ut 84403'
    #end

    #it 'removes county' do
      #text = '639 East Eagleridge Drive, North Salt Lake, Davis County, Utah'
      #parse(text).to_s.must_equal '639 E Eagleridge Dr, North Salt Lake'
    #end

  end

  describe 'normalize' do

    before do
      @address = StreetAddress::US.parse '1111 North 250 W., SALT LAKE CITY, UT 88888-1234'
    end

    it 'returns nil if nil is the input' do
      normalize(nil).must_equal nil
    end

    it 'removes state' do
      normalize(@address).state.must_equal nil
    end

    it 'removes zipcode' do
      address = normalize(@address)
      address.postal_code.must_equal nil
      address.postal_code_ext.must_equal nil
    end

    it 'capitailizes city names' do
      address = normalize(@address)
      address.city.must_equal 'Salt Lake City'
    end

    it 'capitailizes city names' do
      address = StreetAddress::US.parse '1 RED BIRCH Ln, SALT LAKE CITY, UT'
      normalize(address).street.must_equal 'Red Birch'
    end

    it 'removes periods from prefix' do
      text = '4062 W. 5950 S., Roy'
      address = parse text
      normalize(address).to_s.must_equal text.gsub('.', '')
    end

    it 'keeps Unit after Direction' do
      text = '256 W 350 N Unit B, Vernal'
      address = parse text
      normalize(address).to_s.must_equal text
    end



  end

end
