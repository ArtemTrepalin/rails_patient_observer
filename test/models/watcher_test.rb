require 'test_helper'

class WatcherTest < ActiveSupport::TestCase
  test 'should create watcher' do
    watcher = build :watcher
    watcher.save

    created_watcher = Watcher.last
    assert created_watcher
  end

  test 'should not create watcher without email' do
    watcher = build :watcher, email: nil
    watcher.save

    created_watcher = Watcher.last
    assert_nil created_watcher
  end

  test 'email should be unique' do
    first_watcher = build :watcher, email: 'test@gmail.com'
    first_watcher.save
    second_watcher = build :watcher, email: 'test@gmail.com'
    assert_not second_watcher.save
  end
end
