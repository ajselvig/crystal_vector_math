require "spec"
require "../src/vector_math"
include VectorMath


describe "Vec2" do

  it "adds" do
      (vec2(1.0, 2.0) + vec2(3.0, 4.0)).should eq(vec2(4.0, 6.0))
  end

  it "subtracts" do
    (vec2(4.0, 6.0) - vec2(3.0, 4.0)).should eq(vec2(1.0, 2.0))
  end

  it "scales" do
    (vec2(3.0, 4.0)*2.0).should eq(vec2(6.0, 8.0))
  end

  it "divides" do
    (vec2(3.0, 4.0)/2.0).should eq(vec2(1.5, 2.0))
  end

  it "computes magnitude" do
    vec2(2.0, 2.0).mag.should be_close(2.82842712475, 0.00000001)
  end

  it "normalizes" do
    vec2(1.0, 2.0).normalize.mag.should be_close(1.0, 0.00000001)
  end

  it "parses" do
    Vec2.parse("10.1, -3.4").should eq(vec2(10.1, -3.4))
  end

end

describe "Vec3" do

  it "adds" do
    (vec3(1.0, 2.0, 3.0) + vec3(3.0, 4.0, 5.0)).should eq(vec3(4.0, 6.0, 8.0))
  end

  it "subtracts" do
    (vec3(4.0, 6.0, 8.0) - vec3(3.0, 4.0, 5.0)).should eq(vec3(1.0, 2.0, 3.0))
  end

  it "scales" do
    (vec3(3.0, 4.0, 5.0)*2.0).should eq(vec3(6.0, 8.0, 10.0))
  end

  it "divides" do
    (vec3(3.0, 4.0, 5.0)/2.0).should eq(vec3(1.5, 2.0, 2.5))
  end

  it "computes magnitude" do
    vec3(2.0, 2.0, 2.0).mag.should be_close(3.46410161514, 0.00000001)
  end

  it "normalizes" do
    vec3(1.0, 2.0, 3.0).normalize.mag.should be_close(1.0, 0.00000001)
  end
end

describe "Vec4" do

  it "adds" do
    (vec4(1.0, 2.0, 3.0, 4.0) + vec4(3.0, 4.0, 5.0, 6.0)).should eq(vec4(4.0, 6.0, 8.0, 10.0))
  end

  it "subtracts" do
    (vec4(4.0, 6.0, 8.0, 10.0) - vec4(3.0, 4.0, 5.0, 6.0)).should eq(vec4(1.0, 2.0, 3.0, 4.0))
  end

  it "scales" do
    (vec4(3.0, 4.0, 5.0, 6.0)*2.0).should eq(vec4(6.0, 8.0, 10.0, 12.0))
  end

  it "divides" do
    (vec4(3.0, 4.0, 5.0, 6.0)/2.0).should eq(vec4(1.5, 2.0, 2.5, 3.0))
  end

  it "converts to a Vec3" do
    vec4(1.0, 2.0, 3.0, 2.0).to_vec3.should eq(vec3(0.5, 1.0, 1.5))
  end

end
