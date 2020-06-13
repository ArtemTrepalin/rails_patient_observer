require 'test_helper'

class HelpAddressesTest < ActiveSupport::TestCase
  test 'should create address' do
    address = build :help_address
    address.save

    created_address = HelpAddress.last
    assert created_address
  end

  test 'should not create address without name' do
    address = build :help_address, name: nil
    address.save

    created_address = HelpAddress.last
    assert_nil created_address
  end
end
