# ArrayIncludeMethods 1.4.0 - Ruby Refinement
[![Gem Version](https://badge.fury.io/rb/array_include_methods.svg)](http://badge.fury.io/rb/array_include_methods)
[![Build Status](https://travis-ci.com/AndyObtiva/array_include_methods.svg?branch=master)](https://travis-ci.com/AndyObtiva/array_include_methods)
[![Coverage Status](https://coveralls.io/repos/github/AndyObtiva/array_include_methods/badge.svg?branch=master)](https://coveralls.io/github/AndyObtiva/array_include_methods?branch=master)

`Array#include_all?`, `Array#include_any?`, `Array#include_array?`, `Array#array_index`, `Array#array_diff_indices`, and `Array#array_intersection_indices` methods missing from basic Ruby `Array` API.

## Setup

### With Bundler:

Include the following in Gemfile:

```ruby
gem 'array_include_methods', '~> 1.4.0'
```

Run:

```
bundle
```

### Without Bundler:

Run:

```
gem install array_include_methods -v1.4.0
```

## Usage

Add the following line to your application if you are not requiring all gems via Bundler (e.g. `Bundler.require(:default)`):

```ruby
require 'array_include_methods'
```

To activate the `ArrayIncludeMethods` Ruby Refinement for the `Array` class, add the following line to every Ruby file that needs it:

```ruby
using ArrayIncludeMethods
```

Now, you have `#include_all?` and `#include_any?` methods on `Array` objects.

## Examples

### `Array#include_any?(*other_array)`

```ruby
[1, 2, 3, 4].include_any?(2, 4, 5) # returns true
[1, 2, 3, 4].include_any?(6, 7) # returns false
[1, 2, 3, 4].include_any?() # returns true
[1, 2, 3, 4].include_any?(nil) # returns false
```

### `Array#include_all?(*other_array)`

```ruby
[1, 2, 3, 4].include_all?(2, 3) # returns true
[1, 2, 3, 4].include_all?(2, 4) # returns true
[1, 2, 3, 4].include_all?(4, 2) # returns true
[1, 2, 3, 4].include_all?(4, 2, same_sort: true) # returns false
[1, 2, 3, 4].include_all?(2, 4, 4) # returns true
[1, 2, 3, 4].include_all?(2, 4, 5) # returns false
[1, 2, 3, 4].include_all?() # returns true
[1, 2, 3, 4].include_all?(nil) # returns false
```

### `Array#include_array?(other_array)`

```ruby
[1, 2, 3, 4].include_array?([2, 3]) # returns true
[1, 2, 3, 4].include_array?([2, 4]) # returns false
[1, 2, 3, 4].include_array?([4, 2]) # returns false
[1, 2, 3, 4].include_array?([2, 4, 4]) # returns false
[1, 2, 3, 4].include_array?([2, 4, 5]) # returns false
[1, 2, 3, 4].include_array?([]) # returns true
[1, 2, 3, 4].include_array?([nil]) # returns false
```

### `Array#array_index(other_array)`

Returns first array index of `other_array` in `first_array` assuming `first_array.include_all?(other_array)` returns true

```ruby
[1, 2, 3, 4].array_index([2, 3, 4]) # returns 1
[1, 2, 3, 4].array_index([2, 3]) # returns 1
[1, 2, 3, 4].array_index([3, 4]) # returns 2
[1, 2, 3, 4].array_index([2, 4]) # returns -1
[1, 2, 3, 4].array_index([4, 2]) # returns -1
[1, 2, 3, 4].array_index([2, 4, 5]) # returns -1
[1, 2, 3, 4].array_index([]) # returns -1
[1, 2, 3, 4].array_index(nil) # returns -1
```

### `Array#array_intersection_indexes(other_array)`
(alias: `Array#array_intersection_indices(other_array)`)

Returns indexes from `self` array for which elements match elements in `other_array` assuming same sort

```ruby
[1, 2, 3, 4].array_intersection_indexes([2, 3, 4]) # returns [1, 2, 3]
[1, 2, 3, 4].array_intersection_indexes([2, 3]) # returns [1, 2]
[1, 2, 3, 4].array_intersection_indexes([3, 4]) # returns [2, 3]
[1, 2, 3, 4].array_intersection_indexes([2, 4]) # returns [1, 3]
[1, 2, 3, 4].array_intersection_indexes([4, 2]) # returns [3]
[1, 2, 3, 4].array_intersection_indexes([2, 4, 5]) # returns [1, 3]
[1, 2, 3, 4].array_intersection_indexes([]) # returns []
[1, 2, 3, 4].array_intersection_indexes(nil) # returns []
```

### `Array#array_diff_indexes(other_array)`
(alias: `Array#array_diff_indices(other_array)`)

Returns indexes from `self` array for which elements do not match elements in `other_array` assuming same sort

```ruby
[1, 2, 3, 4].array_diff_indexes([2, 3, 4]) # returns [0]
[1, 2, 3, 4].array_diff_indexes([2, 3]) # returns [0, 3]
[1, 2, 3, 4].array_diff_indexes([3, 4]) # returns [0, 1]
[1, 2, 3, 4].array_diff_indexes([2, 4]) # returns [0, 2]
[1, 2, 3, 4].array_diff_indexes([4, 2]) # returns [0, 1, 2]
[1, 2, 3, 4].array_diff_indexes([2, 4, 5]) # returns [0, 2]
[1, 2, 3, 4].array_diff_indexes([]) # returns [0, 1, 2, 3]
[1, 2, 3, 4].array_diff_indexes(nil) # returns [0, 1, 2, 3]
```

## Opal Compatibility

This gem degrades gracefully to monkey-patching in [Opal Ruby](https://opalrb.com) and provides a `using` method shim so consumer code does not have to change if it used gems that rely on the Ruby refinement

## TODO

[TODO.md](TODO.md)

## Change Log

[CHANGELOG.md](CHANGELOG.md)

## Contributing to array_include_methods
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2020 Andy Maleh. See LICENSE.txt for
further details.
