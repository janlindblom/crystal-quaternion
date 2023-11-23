# quaternion

The Quaternion shard adds Quaternions to your Crystal project.

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     quaternion:
       github: janlindblom/crystal-quaternion
   ```

2. Run `shards install`

## Usage

```crystal
require "quaternion"

# Zero quaternion
q_zero = Quaternion.zero

# Two quaternions
q_a = Quaternion.new(1,2,3,4)
a_b = Quaternion.new(5,6,7,8)

# Adding two quaternions
q_sum = q_a + q_b
```

TODO: Write usage instructions here

## Development

TODO: Write development instructions here

## Contributing

1. Fork it (<https://github.com/janlindblom/crystal-quaternion/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Jan Lindblom](https://github.com/janlindblom) - creator and maintainer
