require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

require 'array_include_methods'

using ArrayIncludeMethods

describe 'ArrayIncludeMethods' do
  let(:array1) { [1, 2, 3, 4] }
  let(:array2) { [2, 4] }
  let(:array3) { [4, 5] }
  let(:array4) { [] }
  let(:array5) { [] }
  let(:array6) { nil }
  let(:array7) { [7, 8] }
  let(:array8) { [4, 2] }
  let(:array9) { [1, 2, 2, 4] }
  let(:array10) { [2, 1, 1] }
  let(:array11) { [1, :a, :a, :b, 'bee', 'see', true, true] }
  let(:array12) { [1, :a, 'bee', true] }
  
  describe '#include_all?' do
    it 'returns true if current array includes all elements from another array' do
      expect(array1.include_all?(array2)).to eq(true)
    end

    it 'returns true if current array includes all elements from another array in reverse order' do
      expect(array1.include_all?(array8)).to eq(true)
    end

    it 'returns true if current array includes all elements from another array with repetition' do
      expect(array9.include_all?(array10)).to eq(true)
    end

    it 'returns true if current array includes all elements from another array with different object types' do
      expect(array11.include_all?(array12)).to eq(true)
    end

    it 'returns false if current array is missing one element from another array' do
      expect(array3.include_all?(array2)).to eq(false)
    end

    it 'returns true if current array is non-empty and other array is empty' do
      expect(array2.include_all?(array4)).to eq(true)
    end

    it 'returns true if current array is empty and other array is empty' do
      expect(array4.include_all?(array5)).to eq(true)
    end

    it 'returns true if current array is empty and other array is non-empty' do
      expect(array4.include_all?(array3)).to eq(false)
    end

    it 'returns false if current array is non-empty and other array is nil' do
      expect(array1.include_all?(array6)).to eq(false)
    end

    it 'returns false if current array is empty and other array is nil' do
      expect(array4.include_all?(array6)).to eq(false)
    end
  end
  
  describe '#include_any?' do
    it 'returns true if current array includes any elements from another array' do
      expect(array1.include_any?(array3)).to eq(true)
    end

    it 'returns false if current array is missing all elements from another array' do
      expect(array1.include_any?(array7)).to eq(false)
    end

    it 'returns true if current array is non-empty and other array is empty' do
      expect(array2.include_any?(array4)).to eq(true)
    end

    it 'returns true if current array is empty and other array is empty' do
      expect(array4.include_any?(array5)).to eq(true)
    end

    it 'returns true if current array is empty and other array is non-empty' do
      expect(array4.include_any?(array3)).to eq(false)
    end

    it 'returns false if current array is non-empty and other array is nil' do
      expect(array1.include_any?(array6)).to eq(false)
    end

    it 'returns false if current array is empty and other array is nil' do
      expect(array4.include_any?(array6)).to eq(false)
    end
  end
end
