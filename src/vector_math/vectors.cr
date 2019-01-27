
module VectorMath

  # An immutable pair of x/y coordinates
  struct Vec2
    getter x, y

    def initialize(@x : Float64, @y : Float64)
    end

    def to_s
      "[#{@x},#{@y}]"
    end

    def svg_pair
      "#{@x},#{@y}"
    end

    def self.parse(s)
      comps = s.split(",")
      x = comps[0].to_f
      y = comps[1].to_f
      Vec2.new x, y
    end

    def +(other : Vec2)
      Vec2.new(x + other.x, y + other.y)
    end

    def +(other : Float64)
      Vec2.new(x + other, y + other)
    end

    def -(other)
      Vec2.new(x - other.x, y - other.y)
    end

    def *(scalar : Float64)
      Vec2.new(x*scalar, y*scalar)
    end

    def *(other : Vec2)
      Vec2.new(x*other.x, y*other.y)
    end

    def /(scalar)
      Vec2.new(x/scalar, y/scalar)
    end

    def mag
      Math.sqrt(x*x + y*y)
    end

    def normalize
      m = mag
      Vec2.new(x / m, y / m)
    end

    def self.unit
      Vec2.new(1.0, 1.0)
    end

    def self.x_unit
      Vec2.new(1.0, 0.0)
    end

    def self.y_unit
      Vec2.new(0.0, 1.0)
    end

  end

  # An immutable set of x/y/z coordinates
  struct Vec3
    getter x, y, z

    def initialize(@x : Float64, @y : Float64, @z : Float64)
    end

    def initialize(values : Array(Float64))
      @x = values[0]
      @y = values[1]
      @z = values[2]
    end

    def to_s
      "[#{@x},#{@y},#{@z}]"
    end

    def +(other)
      Vec3.new(x + other.x, y + other.y, z + other.z)
    end

    def -(other)
      Vec3.new(x - other.x, y - other.y, z - other.z)
    end

    def *(scalar)
      Vec3.new(x*scalar, y*scalar, z*scalar)
    end

    def /(scalar)
      Vec3.new(x/scalar, y/scalar, z/scalar)
    end

    def mag
      Math.sqrt(x*x + y*y + z*z)
    end

    def normalize
      m = mag
      Vec3.new(x / m, y / m, z / m)
    end

    # throw away the z component
    def to_vec2
      Vec2.new x, y
    end

    # add w=1.0
    def to_vec4
      Vec4.new x, y, z, 1.0
    end

    def self.unit
      Vec3.new(1.0, 1.0, 1.0)
    end

    def self.x_unit
      Vec3.new(1.0, 0.0, 0.0)
    end

    def self.y_unit
      Vec3.new(0.0, 1.0, 0.0)
    end

    def self.z_unit
      Vec3.new(0.0, 0.0, 1.0)
    end

  end



  # An immutable set of x/y/z/w homogeneous coordinates
  struct Vec4
    getter x, y, z, w

    def initialize(@x : Float64, @y : Float64, @z : Float64, @w : Float64 = 1.0)
    end

    def initialize(values : Array(Float64))
      @x = values[0]
      @y = values[1]
      @z = values[2]
      @w = values[3]
    end

    def to_s
      "[#{@x},#{@y},#{@z},#{@w}]"
    end

    def +(other)
      Vec4.new(x + other.x, y + other.y, z + other.z, w + other.w)
    end


    def -(other)
      Vec4.new(x - other.x, y - other.y, z - other.z, w - other.w)
    end

    def *(scalar)
      Vec4.new(x*scalar, y*scalar, z*scalar, w*scalar)
    end

    def /(scalar)
      Vec4.new(x/scalar, y/scalar, z/scalar, w/scalar)
    end

    def mag
      Math.sqrt(x*x + y*y + z*z)
    end

    def normalize
      m = mag
      Vec4.new(x / m, y / m, z / m, w / m)
    end

    def self.unit
      Vec4.new(1.0, 1.0, 1.0, 1.0)
    end

    def self.x_unit
      Vec4.new(1.0, 0.0, 0.0, 1.0)
    end

    def self.y_unit
      Vec4.new(0.0, 1.0, 0.0, 1.0)
    end

    def self.z_unit
      Vec4.new(0.0, 0.0, 1.0, 1.0)
    end

    def to_vec3
      Vec3.new x/w, y/w, z/w
    end

  end

end
