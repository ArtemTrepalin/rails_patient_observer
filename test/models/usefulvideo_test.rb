require 'test_helper'

class UsefulvideoTest < ActiveSupport::TestCase
  test 'should create usefulvideo' do
    usefulvideo = build :useful_video
    usefulvideo.save

    created_history = UsefulVideo.last
    assert created_history
  end

  test 'should not create usefulvideo without link' do
    usefulvideo = build :useful_video, link: nil
    usefulvideo.save

    created_history = UsefulVideo.last
    assert_nil created_history
  end
end
