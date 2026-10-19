require "test_helper"

class PartTest < ActiveSupport::TestCase
  test "All methods" do
    existing_parts = Part.all
    assert_not_empty(existing_parts)
  end

  test ""
end
