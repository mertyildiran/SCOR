require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save comment without commenter" do
    comment = Comment.new
    assert_not comment.save
  end

end
