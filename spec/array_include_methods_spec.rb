require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

load 'array_include_methods.rb'

using ArrayIncludeMethods

describe 'ArrayIncludeMethods' do
  let(:array1) { [1, 2, 3, 4] }
  let(:array2) { [2, 3] }
  let(:array2a) { [2, 4] }
  let(:array3) { [4, 5] }
  let(:array4) { [] }
  let(:array5) { [] }
  let(:array6) { nil }
  let(:array7) { [7, 8] }
  let(:array8) { [4, 2] }
  let(:array9) { [1, 2, 2, 4] }
  let(:array10) { [1, 2, 2] }
  let(:array11) { [1, :a, :a, :b, 'bee', 'see', true, true, nil, nil] }
  let(:array12) { [1, :a, :a, :b, 'bee', 'see', true, true, nil] }
  let(:array13) { [1, 2, {a: 3}, {b: 4}, {c: 5}, nil] }
  let(:array14) { [2, {a: 3}, {b: 4}, {c: 5}, nil] }
  let(:array15) { [1] }
  let(:array16) { [1, {a: 1}, :a, :a, :b, 'bee', 'see', true, true, {a: 1}, {a: 1}] }
  
  describe '#include_all?' do
    it 'returns true if current array includes all elements' do
      expect(array1.include_all?(*array2)).to eq(true)
    end

    it 'returns true if current array includes all elements' do
      expect(array1.include_all?(*array2, same_sort: true)).to eq(true)
    end

    it 'returns true if current array includes spaced elements' do
      expect(array1.include_all?(*array2a)).to eq(true)
    end

    it 'returns true if current array includes all elements in reverse order' do
      expect(array1.include_all?(*array8)).to eq(true)
    end

    it 'returns true if current array includes spaced elements' do
      expect(array1.include_all?(*array8, same_sort: true)).to eq(false)
    end
 
    it 'returns true if current array includes all elements with repetition' do
      expect(array9.include_all?(*array10)).to eq(true)
    end

    it 'returns true if current array includes all elements with different object types' do
      expect(array11.include_all?(*array12)).to eq(true)
    end

    it 'returns true if current array includes all elements with unsortable object types' do
      expect(array13.include_all?(*array14)).to eq(true)
    end

    it 'returns false if current array is missing one element' do
      expect(array3.include_all?(*array2)).to eq(false)
    end

    it 'returns true if current array is non-empty and other array is empty' do
      expect(array2.include_all?(*array4)).to eq(true)
    end

    it 'returns true if current array is empty and other array is empty' do
      expect(array4.include_all?(*array5)).to eq(true)
    end

    it 'returns true if current array is empty and other array is non-empty' do
      expect(array4.include_all?(*array3)).to eq(false)
    end

    it 'returns false if current array is non-empty and other array is nil' do
      expect(array1.include_all?(*array6)).to eq(true)
    end

    it 'returns false if current array is empty and other array is nil' do
      expect(array4.include_all?(*array6)).to eq(true)
    end

    it 'returns true if current array is includes other array as one element' do
      expect(array15.include_all?(*array15)).to eq(true)
    end

    it 'returns false if current array does not include other array as one element' do
      expect(array2.include_all?(*array15)).to eq(false)
    end
  end
  
  describe '#include_array?' do
    it 'returns true if current array includes all elements from another array' do
      expect(array1.include_array?(array2)).to eq(true)
    end

    it 'returns false if current array includes spaced elements from another array' do
      expect(array1.include_array?(array2a)).to eq(false)
    end

    it 'returns false if current array includes all elements from another array' do
      expect(array1.include_array?(array8)).to eq(false)
    end

    it 'returns false if current array includes all elements from another array' do
      expect(array9.include_array?(array10)).to eq(true)
    end

    it 'returns true if current array includes all elements from another array with different object types' do
      expect(array11.include_array?(array12)).to eq(true)
    end

    it 'returns true if current array includes all elements from another array with unsortable object types' do
      expect(array13.include_array?(array14)).to eq(true)
    end

    it 'returns false if current array is missing one element from another array' do
      expect(array3.include_array?(array2)).to eq(false)
    end

    it 'returns true if current array is non-empty and other array is empty' do
      expect(array2.include_array?(array4)).to eq(true)
    end

    it 'returns true if current array is empty and other array is empty' do
      expect(array4.include_array?(array5)).to eq(true)
    end

    it 'returns true if current array is empty and other array is non-empty' do
      expect(array4.include_array?(array3)).to eq(false)
    end

    it 'returns false if current array is non-empty and other array is nil' do
      expect(array1.include_array?(array6)).to eq(false)
    end

    it 'returns false if current array is empty and other array is nil' do
      expect(array4.include_array?(array6)).to eq(false)
    end

    it 'returns true if current array is includes other array as one element' do
      expect(array15.include_array?(array15)).to eq(true)
    end

    it 'returns false if current array does not include other array as one element' do
      expect(array2.include_array?(array15)).to eq(false)
    end
  end
  
  describe '#include_any?' do
    it 'returns true if current array includes any elements from another array' do
      expect(array1.include_any?(*array3)).to eq(true)
    end

    it 'returns false if current array is missing all elements from another array' do
      expect(array1.include_any?(*array7)).to eq(false)
    end

    it 'returns true if current array is non-empty and other array is empty' do
      expect(array2.include_any?(*array4)).to eq(true)
    end

    it 'returns true if current array is empty and other array is empty' do
      expect(array4.include_any?(*array5)).to eq(true)
    end

    it 'returns true if current array is empty and other array is non-empty' do
      expect(array4.include_any?(*array3)).to eq(false)
    end

    it 'returns true if current array is non-empty and other array is nil' do
      expect(array1.include_any?(*array6)).to eq(true)
    end

    it 'returns true if current array is empty and other array is nil' do
      expect(array4.include_any?(*array6)).to eq(true)
    end
    
    it 'returns true if current array includes any elements from another array that is one element' do
      expect(array1.include_any?(*array15)).to eq(true)
    end

    it 'returns false if current array does not include any elements from another array as one element' do
      expect(array2.include_any?(*array15)).to eq(false)
    end
  end
  
  describe '#array_index' do
    it 'returns 1' do
      expect(array1.array_index(array2)).to eq(1)
    end

    it 'returns 0' do
      expect(array1.array_index(array15)).to eq(0)
    end

    it 'returns -1 if array does not include second array' do
      expect(array1.array_index(array2a)).to eq(-1)
    end

    it 'returns -1 if other array is empty' do
      expect(array1.array_index(array5)).to eq(0)
    end

    it 'returns -1 if both arrays are empty' do
      expect(array4.array_index(array5)).to eq(0)
    end

    it 'returns -1 if other array is nil' do
      expect(array1.array_index(array6)).to eq(-1)
    end
  end
  
  
  %i[array_intersection_indexes array_intersection_indices].each do |array_intersection_indexes_method|
    describe "##{array_intersection_indexes_method}" do
      it 'returns [1, 2]' do
        expect(array1.send(array_intersection_indexes_method, array2)).to eq([1, 2])
      end
  
      it 'returns [0]' do
        expect(array1.array_intersection_indices(array15)).to eq([0])
      end
  
      it 'returns [1, 3]' do
        expect(array1.send(array_intersection_indexes_method, array2a)).to eq([1, 3])
      end
  
      it 'returns [3]' do
        expect(array1.send(array_intersection_indexes_method, array8)).to eq([3])
      end
  
      it 'returns []' do
        expect(array1.send(array_intersection_indexes_method, array5)).to eq([])
      end
  
      it 'returns []' do
        expect(array4.send(array_intersection_indexes_method, array5)).to eq([])
      end
  
      it 'returns [] for nil array' do
        expect(array1.send(array_intersection_indexes_method, array6)).to eq([])
      end
    end
  end
  
  describe '#array_intersection' do
    it 'returns [1, 2]' do
      expect(array1.array_intersection(array2)).to eq([2, 3])
    end

    it 'returns [0]' do
      expect(array1.array_intersection(array15)).to eq([1])
    end

    it 'returns [1, 3]' do
      expect(array1.array_intersection(array2a)).to eq([2, 4])
    end

    it 'returns [3]' do
      expect(array1.array_intersection(array8)).to eq([4])
    end

    it 'returns []' do
      expect(array1.array_intersection(array5)).to eq([])
    end

    it 'returns []' do
      expect(array4.array_intersection(array5)).to eq([])
    end

    it 'returns [] for nil array' do
      expect(array1.array_intersection(array6)).to eq([])
    end
  end
  
  %i[array_diff_indexes array_diff_indices array_difference_indexes array_difference_indices].each do |array_diff_indexes_method|
    describe "##{array_diff_indexes_method}" do
      it 'returns [0, 3]' do
        expect(array1.send(array_diff_indexes_method, array2)).to eq([0, 3])
      end
  
      it 'returns [1, 2, 3]' do
        expect(array1.send(array_diff_indexes_method, array15)).to eq([1, 2, 3])
      end
  
      it 'returns [0, 2]' do
        expect(array1.send(array_diff_indexes_method, array2a)).to eq([0, 2])
      end
  
      it 'returns [0, 1, 2]' do
        expect(array1.send(array_diff_indexes_method, array8)).to eq([0, 1, 2])
      end
  
      it 'returns [0, 1, 2, 3]' do
        expect(array1.send(array_diff_indexes_method, array5)).to eq([0, 1, 2, 3])
      end
  
      it 'returns []' do
        expect(array4.send(array_diff_indexes_method, array5)).to eq([])
      end
  
      it 'returns [0, 1, 2, 3] for nil array' do
        expect(array1.send(array_diff_indexes_method, array6)).to eq([0, 1, 2, 3])
      end
  
      it 'returns TODO for array 11 and 12' do
        # TODO
#         expect(array11.send(array_diff_indexes_method, array12)).to eq([8])
      end
  
      it 'returns TODO for array 13 & 14' do
        # TODO
#         expect(array13.send(array_diff_indexes_method, array14)).to eq([0])
      end
    end
  end
  
  %i[array_diff array_difference].each do |array_diff_method|
    describe "##{array_diff_method}" do
      it 'returns [0, 3]' do
        expect(array1.send(array_diff_method, array2)).to eq([1, 4])
      end
  
      it 'returns [1, 2, 3]' do
        expect(array1.send(array_diff_method, array15)).to eq([2, 3, 4])
      end

      it 'returns [0, 2]' do
        expect(array1.send(array_diff_method, array2a)).to eq([1, 3])
      end

      it 'returns [0, 1, 2]' do
        expect(array1.send(array_diff_method, array8)).to eq([1, 2, 3])
      end

      it 'returns [0, 1, 2, 3]' do
        expect(array1.send(array_diff_method, array5)).to eq([1, 2, 3, 4])
      end

      it 'returns []' do
        expect(array4.send(array_diff_method, array5)).to eq([])
      end

      it 'returns [0, 1, 2, 3] for nil array' do
        expect(array1.send(array_diff_method, array6)).to eq([1, 2, 3, 4])
      end
    end
  end
  
  describe '#duplicates' do
    it 'returns [] for array1' do
      expect(array1.duplicates).to eq([])
    end

    it 'returns duplicates for array11' do
      expect(array11.duplicates).to eq([:a, true, nil])
    end

    it 'returns duplicates for array12' do
      expect(array12.duplicates).to eq([:a, true])
    end

    it 'returns duplicates for array16' do
      expect(array16.duplicates).to eq([{a: 1}, :a, true])
    end

    it 'returns duplicates for empty array' do
      expect([].duplicates).to eq([])
    end
  end
end
