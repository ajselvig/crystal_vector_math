
module VectorMath

  # An immutable pair of x/y coordinates
  struct Vec2
    getter x, y

    def initialize(@x : Float64 = 0.0, @y : Float64 = 0.0)
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
      vec2 x, y
    end

    def +(other : Vec2)
      vec2(x + other.x, y + other.y)
    end

    def +(other : Float64)
      vec2(x + other, y + other)
    end

    def -(other)
      vec2(x - other.x, y - other.y)
    end

    def *(scalar : Float64)
      vec2(x*scalar, y*scalar)
    end

    def *(other : Vec2)
      vec2(x*other.x, y*other.y)
    end

    def /(scalar)
      vec2(x/scalar, y/scalar)
    end

    def mag
      Math.sqrt(x*x + y*y)
    end

    def normalize
      m = mag
      vec2(x / m, y / m)
    end

    def self.unit
      vec2(1.0, 1.0)
    end

    def self.x_unit
      vec2(1.0, 0.0)
    end

    def self.y_unit
      vec2(0.0, 1.0)
    end

  end

  # convenience function for creating Vec2
  def vec2(x : Float64 = 0.0, y : Float64 = 0.0)
    Vec2.new x, y
  end

  # An immutable set of x/y/z coordinates
  struct Vec3
    getter x, y, z

    def initialize(@x : Float64 = 0.0, @y : Float64 = 0.0, @z : Float64 = 0.0)
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
      vec3(x + other.x, y + other.y, z + other.z)
    end

    def -(other)
      vec3(x - other.x, y - other.y, z - other.z)
    end

    def *(scalar)
      vec3(x*scalar, y*scalar, z*scalar)
    end

    def /(scalar)
      vec3(x/scalar, y/scalar, z/scalar)
    end

    def mag
      Math.sqrt(x*x + y*y + z*z)
    end

    def normalize
      m = mag
      vec3(x / m, y / m, z / m)
    end

    # throw away the z component
    def to_vec2
      vec2 x, y
    end

    # add w=1.0
    def to_vec4
      vec4 x, y, z, 1.0
    end

    def self.unit
      vec3(1.0, 1.0, 1.0)
    end

    def self.x_unit
      vec3(1.0, 0.0, 0.0)
    end

    def self.y_unit
      vec3(0.0, 1.0, 0.0)
    end

    def self.z_unit
      vec3(0.0, 0.0, 1.0)
    end

  end

  # convenience function for creating Vec3
  def vec3(x : Float64 = 0.0, y : Float64 = 0.0, z : Float64 = 0.0)
    Vec3.new x, y, z
  end


  # An immutable set of x/y/z/w homogeneous coordinates
  struct Vec4
    getter x, y, z, w

    def initialize(@x : Float64 = 0.0, @y : Float64 = 0.0, @z : Float64 = 0.0, @w : Float64 = 1.0)
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
      vec4(x + other.x, y + other.y, z + other.z, w + other.w)
    end


    def -(other)
      vec4(x - other.x, y - other.y, z - other.z, w - other.w)
    end

    def *(scalar)
      vec4(x*scalar, y*scalar, z*scalar, w*scalar)
    end

    def /(scalar)
      vec4(x/scalar, y/scalar, z/scalar, w/scalar)
    end

    def mag
      Math.sqrt(x*x + y*y + z*z)
    end

    def normalize
      m = mag
      vec4(x / m, y / m, z / m, w / m)
    end

    def self.unit
      vec4(1.0, 1.0, 1.0, 1.0)
    end

    def self.x_unit
      vec4(1.0, 0.0, 0.0, 1.0)
    end

    def self.y_unit
      vec4(0.0, 1.0, 0.0, 1.0)
    end

    def self.z_unit
      vec4(0.0, 0.0, 1.0, 1.0)
    end

    def to_vec3
      vec3 x/w, y/w, z/w
    end

  end

  # convenience function for creating Vec4
  def vec4(x : Float64 = 0.0, y : Float64 = 0.0, z : Float64 = 0.0, w : Float64 = 0.0)
    Vec4.new x, y, z, w
  end

end
