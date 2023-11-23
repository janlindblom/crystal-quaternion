require "./spec_helper"

describe Quaternion do
  it "has a version number" do
    Quaternion::VERSION.should_not be_nil
  end

  it "the real quaternion 1 is the identity element" do
    q = Quaternion.new(1, 0, 0, 0)
    q.identity_element?.should be_true
  end

  it "the real quaternion commute with all other quaternions" do
    q = Quaternion.new(1, 2, 3, 4)
    a = Quaternion.new(4, 0, 0, 0)
    a.real?.should be_true
    (a * q).should eq(q * a)
  end
end
