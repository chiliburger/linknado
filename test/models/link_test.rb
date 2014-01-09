require 'test_helper'

describe Link do
  before(:each) do
    @link = Link.new
    @link.valid?
  end

  ["name", "uri", "username"].each do |attr|
    it "validates presence of #{attr}" do
      @link.errors[attr.to_sym].must_include "can't be blank"
    end
  end

  it "validates numericality of points" do
    @link.points = "three"

    @link.valid?
    @link.errors[:points].must_include "is not a number"
  end

  it "validates points can only be an integer" do
    @link.points = 34.5

    @link.valid?
    @link.errors[:points].must_include "must be an integer"
  end

  it "validates points must be greater than or equal to zero" do
    @link.points = -3

    @link.valid?
    @link.errors[:points].must_include "must be greater than or equal to 0"
  end

  it "should be able to retrieve comments" do
    assert_respond_to @link, :comments
  end

  it "should destroy all comments on destruction" do
    link    = Link.find(links(:one).id)
    link_id = link.id

    link.comments.count.must_equal 1
    assert link.destroy, true
    Comment.where(link_id: link_id).must_be_empty 
  end

  it "should remove point when remove_point is called" do
    link = Link.find(links(:one).id)
    link.update_attribute(:points, 100)
    link.points.must_equal 100
    link.remove_point
    link.points.must_equal 99
  end

  it "should add a point when add_point is called" do
    link = Link.find(links(:one).id)
    link.update_attribute(:points, 100)
    link.points.must_equal 100
    link.add_point
    link.points.must_equal 101
  end
end
