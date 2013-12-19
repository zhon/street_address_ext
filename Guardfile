
guard 'minitest' do
  watch(%r|^test/(.*)_test\.rb|)
  watch(%r|^lib/(.*?)([^/\\]+)\.rb|)  { |m| "test/#{m[2]}_test.rb" }
  watch(%r|^street_address_ext.rb|)  { |m| "test/street_address_ext_test.rb" }
  watch(%r|^test/helper\.rb|)         { "test" }
end
