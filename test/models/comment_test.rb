require 'test_helper'

describe Comment do
  before(:each) do
    @comment = Comment.new
    @comment.valid?
  end

  ["link_id", "username", "body"].each do |attr|
    it "validates presence of #{attr}" do
      @comment.errors[attr.to_sym].must_include "can't be blank"
    end
  end
end
