# TODO

- Handle missed edge cases for `array_difference_indexes`, `array_intersection_indexes`, `array_difference`, and `array_intersection`
- Provide the option to monkey patch all the array methods without a Ruby refinement.
- Consider calling `if Object.constants.include?(:Motion)` instead of using `begin rescue` in entry point
- Support `Array#include_array?(*elements, contiguous: false)`
- Support `Array#include_array?(*elements, same_sort: false)` (including combining with `contiguous`)
