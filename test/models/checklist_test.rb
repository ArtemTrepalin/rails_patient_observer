require 'test_helper'

class ChecklistTest < ActiveSupport::TestCase
  test 'should create checklist' do
    checklist = build :checklist
    checklist.save

    created_checklist = Checklist.last
    assert created_checklist
  end

  test 'should not create checklist without name' do
    checklist = build :checklist, name: nil
    checklist.save

    created_checklist = Checklist.last
    assert_nil created_checklist
  end
end
