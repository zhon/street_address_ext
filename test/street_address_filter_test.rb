require_relative 'helper'

require 'street_address_filter'

include StreetAddressFilter
describe StreetAddressFilter do

  describe 'parse' do
    before do
      @parser = Parser.new(
        '800 W State St, Farmington, UT',
      )
    end

    it 'returns address string' do
      text = '1111 N 250 W, Harrisville, UT'
      @parser.parse(text).must_equal text
    end

    it 'handles address missing state' do
      text = '1111 N 250 W, Harrisville'
      @parser.parse(text).must_equal text
    end

    describe 'excluded_address returns nil' do

      it 'Farmington' do
        text = '800 W State St, Farmington, UT'
        @parser.parse(text).must_equal nil
      end

    end

    describe 'normalize' do

      before do
        @address = StreetAddress::US.parse '1111 North 250 W., SALT LAKE CITY, UT 88888-1234'
      end

      it 'removes state' do
        @parser.normalize(@address).state.must_equal nil
      end

      it 'removes zipcode' do
        address = @parser.normalize(@address)
        address.postal_code.must_equal nil
        address.postal_code_ext.must_equal nil
      end

      it 'capitailizes city names' do
        address = @parser.normalize(@address)
        address.city.must_equal 'Salt Lake City'
      end

      it 'capitailizes city names' do
        address = StreetAddress::US.parse '1 RED BIRCH Ln, SALT LAKE CITY, UT'
        @parser.normalize(address).street.must_equal 'Red Birch'
      end

      #it 'removes county' do
      #text = '639 East Eagleridge Drive, North Salt Lake, Davis County, Utah'
      #AddressParser.normalize(text).must_equal '639 E Eagleridge Dr, North Salt Lake'
      #end

      #it 'removes periods' do
      #text = '4062 W. 5950 S., Roy, UT'
      #AddressParser.normalize(text).must_equal '4062 W 5950 S, Roy'

      #end

    end

  end

end
