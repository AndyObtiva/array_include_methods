# Change Log

## 1.0.4

- Support splat args (e.g. `include_any?(1, 2, 3)` instead of `include_any?([1, 2, 3])`)

## 1.0.3

- Opal compatibility through monkey-patching and providing a `using` method shim so that existing gems that used the refinement in Ruby work

## 1.0.2

- Handled case of two arrays with elements of unsortable object types (e.g. Hash)

## 1.0.1

- Handled case of two arrays with different ordering of common elements

## 1.0.0

- Initial implementation of Array#include_all? & Array#include_any?
