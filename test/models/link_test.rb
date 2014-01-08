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
end
