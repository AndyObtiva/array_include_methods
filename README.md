# ArrayIncludeMethods - Ruby Refinement
[![Gem Version](https://badge.fury.io/rb/array_include_methods.svg)](http://badge.fury.io/rb/array_include_methods)

`Array#include_all?` & `Array#include_any?` methods missing from basic Ruby `Array` API.

## Setup

### With Bundler:

Include the following in Gemfile:

```ruby
gem 'array_include_methods', '~> 1.0.0'
```

Run:

```
bundle
```

### Without Bundler:

Run:

```
gem install array_include_methods -v1.0.0
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
