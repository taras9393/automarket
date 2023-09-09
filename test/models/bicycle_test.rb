require 'test_helper'

class BicycleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end


test "should not save article without title" do
  bike = Bicycle.new
  assert_not bike.save
end



end
