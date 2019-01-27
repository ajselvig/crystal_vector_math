module VectorMath

  def deg2rad(deg)
    deg * Math::PI / 180.0
  end


  # 3D matrix
  # [x0, x1, x2,
  #  y0, y1, y2,
  #  z0, z1, z2]
  struct Mat3
    getter x0, x1, x2, y0, y1, y2, z0, z1, z2

    def initialize(@x0 : Float64, @x1 : Float64, @x2 : Float64,
      @y0 : Float64, @y1 : Float64, @y2 : Float64,
      @z0 : Float64, @z1 : Float64, @z2 : Float64)
    end

    def initialize(values : Array(Float64))
      @x0 = values[0]
      @x1 = values[1]
      @x2 = values[2]
      @y0 = values[3]
      @y1 = values[4]
      @y2 = values[5]
      @z0 = values[6]
      @z1 = values[7]
      @z2 = values[8]
    end

    def +(scalar)
      mat3(
        x0 + scalar, x1 + scalar, x2 + scalar,
        y0 + scalar, y1 + scalar, y2 + scalar,
        z0 + scalar, z1 + scalar, z2 + scalar
      )
    end

    def -(scalar)
      mat3(
        x0 - scalar, x1 - scalar, x2 - scalar,
        y0 - scalar, y1 - scalar, y2 - scalar,
        z0 - scalar, z1 - scalar, z2 - scalar
      )
    end

    def +(other)
      mat3(
        x0 + other.x0, x1 + other.x1, x2 + other.x2,
        y0 + other.y0, y1 + other.y1, y2 + other.y2,
        z0 + other.z0, z1 + other.z1, z2 + other.z2
      )
    end

    def -(other)
      mat3(
        x0 - other.x0, x1 - other.x1, x2 - other.x2,
        y0 - other.y0, y1 - other.y1, y2 - other.y2,
        z0 - other.z0, z1 - other.z1, z2 - other.z2
      )
    end

    def *(other : Mat3)
      mat3(
        x0*other.x0 + x1*other.y0 + x2*other.z0,
        x0*other.x1 + x1*other.y1 + x2*other.z1,
        x0*other.x2 + x1*other.y2 + x2*other.z2,
        y0*other.x0 + y1*other.y0 + y2*other.z0,
        y0*other.x1 + y1*other.y1 + y2*other.z1,
        y0*other.x2 + y1*other.y2 + y2*other.z2,
        z0*other.x0 + z1*other.y0 + z2*other.z0,
        z0*other.x1 + z1*other.y1 + z2*other.z1,
        z0*other.x2 + z1*other.y2 + z2*other.z2,
      )
    end

    def self.unit
      mat3(
        1.0, 0.0, 0.0,
        0.0, 1.0, 0.0,
        0.0, 0.0, 1.0
      )
    end

  end

  # convenience function for creating Mat3
  def mat3(x0 : Float64, x1 : Float64, x2 : Float64,
    y0 : Float64, y1 : Float64, y2 : Float64,
    z0 : Float64, z1 : Float64, z2 : Float64)
    Mat3.new(x0, x1, x2, y0, y1, y2, z0, z1, z2)
  end

  # 4D matrix
  # [x0, x1, x2, x3,
  #  y0, y1, y2, y3,
  #  z0, z1, z2, z3,
  #  w0, w1, w2, w3]
  struct Mat4
    getter x0, x1, x2, x3, y0, y1, y2, y3, z0, z1, z2, z3, w0, w1, w2, w3

    def initialize(@x0 : Float64, @x1 : Float64, @x2 : Float64, @x3 : Float64,
      @y0 : Float64, @y1 : Float64, @y2 : Float64, @y3 : Float64,
      @z0 : Float64, @z1 : Float64, @z2 : Float64, @z3 : Float64,
      @w0 : Float64, @w1 : Float64, @w2 : Float64, @w3 : Float64)
    end

    def initialize(values : Array(Float64))
      @x0 = values[0]
      @x1 = values[1]
      @x2 = values[2]
      @x3 = values[2]
      @y0 = values[3]
      @y1 = values[4]
      @y2 = values[5]
      @y3 = values[5]
      @z0 = values[6]
      @z1 = values[7]
      @z2 = values[8]
      @z3 = values[8]
      @w0 = values[6]
      @w1 = values[7]
      @w2 = values[8]
      @w3 = values[8]
    end

    def +(scalar)
      mat4(
        x0 + scalar, x1 + scalar, x2 + scalar, x3 + scalar,
        y0 + scalar, y1 + scalar, y2 + scalar, y3 + scalar,
        z0 + scalar, z1 + scalar, z2 + scalar, z3 + scalar,
        w0 + scalar, w1 + scalar, w2 + scalar, w3 + scalar
      )
    end

    def -(scalar)
      mat4(
        x0 - scalar, x1 - scalar, x2 - scalar, x3 - scalar,
        y0 - scalar, y1 - scalar, y2 - scalar, y3 - scalar,
        z0 - scalar, z1 - scalar, z2 - scalar, z3 - scalar,
        w0 - scalar, w1 - scalar, w2 - scalar, w3 - scalar
      )
    end

    def +(other)
      mat4(
        x0 + other.x0, x1 + other.x1, x2 + other.x2, x3 + other.x3,
        y0 + other.y0, y1 + other.y1, y2 + other.y2, y3 + other.y3,
        z0 + other.z0, z1 + other.z1, z2 + other.z2, z3 + other.z3,
        w0 + other.w0, w1 + other.w1, w2 + other.w2, w3 + other.w3
      )
    end

    def -(other)
      mat4(
        x0 - other.x0, x1 - other.x1, x2 - other.x2, x3 - other.x3,
        y0 - other.y0, y1 - other.y1, y2 - other.y2, y3 - other.y3,
        z0 - other.z0, z1 - other.z1, z2 - other.z2, z3 - other.z3,
        w0 - other.w0, w1 - other.w1, w2 - other.w2, w3 - other.w3
      )
    end

    def *(other : Mat4)
      mat4(
        x0*other.x0 + x1*other.y0 + x2*other.z0 + x3*other.w0,
        x0*other.x1 + x1*other.y1 + x2*other.z1 + x3*other.w1,
        x0*other.x2 + x1*other.y2 + x2*other.z2 + x3*other.w2,
        x0*other.x3 + x1*other.y3 + x2*other.z3 + x3*other.w3,
        y0*other.x0 + y1*other.y0 + y2*other.z0 + y3*other.w0,
        y0*other.x1 + y1*other.y1 + y2*other.z1 + y3*other.w1,
        y0*other.x2 + y1*other.y2 + y2*other.z2 + y3*other.w2,
        y0*other.x3 + y1*other.y3 + y2*other.z3 + y3*other.w3,
        z0*other.x0 + z1*other.y0 + z2*other.z0 + z3*other.w0,
        z0*other.x1 + z1*other.y1 + z2*other.z1 + z3*other.w1,
        z0*other.x2 + z1*other.y2 + z2*other.z2 + z3*other.w2,
        z0*other.x3 + z1*other.y3 + z2*other.z3 + z3*other.w3,
        w0*other.x0 + w1*other.y0 + w2*other.z0 + w3*other.w0,
        w0*other.x1 + w1*other.y1 + w2*other.z1 + w3*other.w1,
        w0*other.x2 + w1*other.y2 + w2*other.z2 + w3*other.w2,
        w0*other.x3 + w1*other.y3 + w2*other.z3 + w3*other.w3
      )
    end

    def *(other : Vec4)
      Vec4.new(
        x0*other.x + x1*other.y + x2*other.z + x3*other.w,
        y0*other.x + y1*other.y + y2*other.z + y3*other.w,
        z0*other.x + z1*other.y + z2*other.z + z3*other.w,
        w0*other.x + w1*other.y + w2*other.z + w3*other.w
      )
    end

    def translate(vec : Vec3)
      self * mat4(
        1.0, 0.0, 0.0, vec.x,
        0.0, 1.0, 0.0, vec.y,
        0.0, 0.0, 1.0, vec.z,
        0.0, 0.0, 0.0, 1.0
      )
    end

    def rotate_x(deg : Float64)
      rad = deg2rad deg
      cos = Math.cos rad
      sin = Math.sin rad
      self * mat4(
        1.0, 0.0, 0.0, 0.0,
        0.0, cos, -sin, 0.0,
        0.0, sin, cos, 0.0,
        0.0, 0.0, 0.0, 1.0
      )
    end

    def rotate_y(deg : Float64)
      rad = deg2rad deg
      cos = Math.cos rad
      sin = Math.sin rad
      self * mat4(
        cos, 0.0, sin, 0.0,
        0.0, 1.0, 0.0, 0.0,
        -sin, 0.0, cos, 0.0,
        0.0, 0.0, 0.0, 1.0
      )
    end

    def rotate_z(deg : Float64)
      rad = deg2rad deg
      cos = Math.cos rad
      sin = Math.sin rad
      self * mat4(
        cos, -sin, 0.0, 0.0,
        sin, cos, 0.0, 0.0,
        0.0, 0.0, 1.0, 0.0,
        0.0, 0.0, 0.0, 1.0
      )
    end

    # returns the rotation component of the matrix
    def rotation
      mat4(
        x0, x1, x2, 0.0,
        y0, y1, y2, 0.0,
        z0, z1, z2, 0.0,
        0.0, 0.0, 0.0, 1.0
      )
    end


    def self.unit
      mat4(
        1.0, 0.0, 0.0, 0.0,
        0.0, 1.0, 0.0, 0.0,
        0.0, 0.0, 1.0, 0.0,
        0.0, 0.0, 0.0, 1.0
      )
    end

  end

  # convenience function for creating Mat3
  def mat4(x0 : Float64, x1 : Float64, x2 : Float64, x3 : Float64,
    y0 : Float64, y1 : Float64, y2 : Float64, y3 : Float64,
    z0 : Float64, z1 : Float64, z2 : Float64, z3 : Float64,
    w0 : Float64, w1 : Float64, w2 : Float64, w3 : Float64)
    Mat4.new(x0, x1, x2, x3, y0, y1, y2, y3, z0, z1, z2, z3, w0, w1, w2, w3)
  end


end
