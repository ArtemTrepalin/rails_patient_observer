require 'test_helper'

class HistoryTest < ActiveSupport::TestCase
  test 'should create history' do
    history = build :history
    history.save

    created_history = History.last
    assert created_history
  end

  test 'should not create history without status' do
    history = build :history, status: nil
    history.save

    created_history = History.last
    assert_nil created_history
  end
end
