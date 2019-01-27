require "spec"
require "../src/vector_math"
include VectorMath

describe "Mat3" do

  it "adds" do
    sum = Mat3.unit + Mat3.unit
    sum.x0.should eq(2.0)
  end

  it "subtracts" do
    diff = Mat3.unit - Mat3.unit
    diff.x0.should eq(0.0)
  end

  it "multiplies" do
    a = mat3 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0
    b = mat3 9.0, 8.0, 7.0, 6.0, 5.0, 4.0, 3.0, 2.0, 1.0
    prod = a * b
    prod.x0.should eq(30.0)
    prod.x1.should eq(24.0)
    prod.x2.should eq(18.0)
    prod.y0.should eq(84.0)
    prod.y1.should eq(69.0)
    prod.y2.should eq(54.0)
    prod.z0.should eq(138.0)
    prod.z1.should eq(114.0)
    prod.z2.should eq(90.0)
  end

end

describe "Mat4" do

  it "adds" do
    sum = Mat4.unit + Mat4.unit
    sum.w3.should eq(2.0)
  end

  it "subtracts" do
    diff = Mat4.unit - Mat4.unit
    diff.w3.should eq(0.0)
  end

  it "translates" do
    trans = Mat4.unit.translate Vec3.new(1.0, 1.0, 1.0)
    a = Vec4.new 1.0, 2.0, 3.0
    b = trans * a
    b.x.should eq(2.0)
    b.y.should eq(3.0)
    b.z.should eq(4.0)
  end

  it "rotates" do
    x_rot = Mat4.unit.rotate_x 90.0
    a = Vec4.new 0.0, 1.0, 0.0
    b = x_rot * a
    b.x.should eq(0.0)
    b.y.should be_close(0.0, 0.000001)
    b.z.should eq(1.0)

    y_rot = Mat4.unit.rotate_y 90.0
    a = Vec4.new 1.0, 0.0, 0.0
    b = y_rot * a
    b.x.should be_close(0.0, 0.000001)
    b.y.should eq(0.0)
    b.z.should eq(-1.0)

    z_rot = Mat4.unit.rotate_z 90.0
    a = Vec4.new 1.0, 0.0, 0.0
    b = z_rot * a
    b.x.should be_close(0.0, 0.000001)
    b.y.should eq(1.0)
    b.z.should eq(0.0)
  end

  it "multiplies by another matrix" do
    a = mat4 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0, 12.0, 13.0, 14.0, 15.0, 16.0
    b = mat4 16.0, 15.0, 14.0, 13.0, 12.0, 11.0, 10.0, 9.0, 8.0, 7.0, 6.0, 5.0, 4.0, 3.0, 2.0, 1.0
    prod = a * b
    prod.x0.should eq(80.0)
    prod.x1.should eq(70.0)
    prod.x2.should eq(60.0)
    prod.x3.should eq(50.0)
    prod.y0.should eq(240.0)
    prod.y1.should eq(214.0)
    prod.y2.should eq(188.0)
    prod.y3.should eq(162.0)
    prod.z0.should eq(400.0)
    prod.z1.should eq(358.0)
    prod.z2.should eq(316.0)
    prod.z3.should eq(274.0)
    prod.w0.should eq(560.0)
    prod.w1.should eq(502.0)
    prod.w2.should eq(444.0)
    prod.w3.should eq(386.0)
  end

  it "multiplies by a vector" do
    a = mat4 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0, 12.0, 13.0, 14.0, 15.0, 16.0
    b = Vec4.new 1.0, 2.0, 3.0, 4.0
    prod = a * b
    prod.x.should eq(30.0)
    prod.y.should eq(70.0)
    prod.z.should eq(110.0)
    prod.w.should eq(150.0)
  end

end
