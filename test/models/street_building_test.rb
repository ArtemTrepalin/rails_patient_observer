require 'test_helper'

class StreetBuildingTest < ActiveSupport::TestCase
  test 'should be create street_building with company and city' do
    street_building = create :street_building
    assert street_building
  end
end
