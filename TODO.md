# TODO

- Provide the option to monkey patch all the array methods without a Ruby refinement.
- Add array_difference_indices and array_difference_indexes as aliases for array_diff_indices
- Consider calling `if Object.constants.include?(:Motion)` instead of using `begin rescue` in entry point
- Support `Array#include_array?(*elements, contiguous: false)`
- Support `Array#include_array?(*elements, same_sort: false)` (including combining with `contiguous`)
