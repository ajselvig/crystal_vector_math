# vector_math

Crystal library for basic 2D, 3D, and 4D vector and matrix math.

It's currently quite small, but includes:

* Everything is a struct, so everything happens on the stack
* Completely immutable, so behavior is easy to reason about
* Operator overloading for +, -, * and /
* Rotation and translation helpers for 4D matrices


## Installation

1. Add the dependency to your `shard.yml`:
```yaml
dependencies:
  vector_math:
    github: ajselvig/crystal_vector_math
```
2. Run `shards install`

## Usage

```crystal
require "vector_math"
include VectorMath

# 2D vectors
Vec2.new(1.0, 2.0) + Vec2.new(3.0, 4.0)
# => [4.0, 6.0]
Vec2.new(2.0, 4.0, 6.0) / 2
# => [1.0, 2.0, 3.0]
```


## Contributing

1. Fork it (<https://github.com/ajselvig/crystal_vector_math/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Andy Selvig](https://github.com/ajselvig) - creator and maintainer
