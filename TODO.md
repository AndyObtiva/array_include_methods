# TODO

- Provide the option to monkey patch all the array methods without a Ruby refinement.
- Add exact_diff_indices/exact_diff_indexes as aliases for array_diff_indices
- Support exact_diff/exact_difference (they return elements of exact_diff_indices)
- Support duplicates
- Consider calling `if Object.constants.include?(:Motion)` instead of using `begin rescue` in entry point
- Support `Array#include_array?(*elements, contiguous: false)`
- Support `Array#include_array?(*elements, same_sort: false)` (including combining with `contiguous`)
