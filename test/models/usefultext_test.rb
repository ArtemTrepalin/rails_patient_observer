require 'test_helper'

class UsefulTextTest < ActiveSupport::TestCase
  test 'should create usefultext' do
    usefultext = build :useful_text
    usefultext.save

    created_history = UsefulText.last
    assert created_history
  end

  test 'should not create usefultext without description' do
    usefultext = build :useful_text, description: nil
    usefultext.save

    created_history = UsefulText.last
    assert_nil created_history
  end
end
