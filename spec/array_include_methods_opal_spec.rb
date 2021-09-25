require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe 'ArrayIncludeMethods Opal' do
  before :all do
    RUBY_PLATFORM = 'opal'
    
    load 'array_include_methods.rb'
    
    MAIN.using ArrayIncludeMethods
  end
  
  after :all do
    RUBY_PLATFORM = ORIGINAL_RUBY_PLATFORM
    Object.send(:remove_const, :ArrayIncludeMethods)
    Array.undef_method(:include_any?)
    Array.undef_method(:include_all?)
  end

  let(:array1) { [1, 2, 3, 4] }
  let(:array2) { [2, 4] }
  let(:array3) { [4, 5] }
  let(:array4) { [] }
  let(:array5) { [] }
  let(:array6) { nil }
  let(:array7) { [7, 8] }
  let(:array8) { [4, 2] }
  let(:array9) { [1, 2, 2, 4] }
  let(:array10) { [1, 2, 2] }
  let(:array11) { [1, :a, :a, :b, 'bee', 'see', true, true, nil, nil] }
  let(:array12) { [1, :a, 'bee', true, nil] }
  let(:array13) { [1, 2, {a: 3}, {b: 4}, {c: 5}, nil] }
  let(:array14) { [1, {a: 3}, {b: 4}, nil] }
  
  describe '#include_all?' do
    it 'returns true if current array includes all elements from another array' do
      expect(array1.include_all?(array2)).to eq(true)
    end

    it 'returns true if current array includes all elements from another array in reverse order but false if checking against array directly' do
      expect(array1.include_all?(*array8)).to eq(true)
      expect(array1.include_all?(array8)).to eq(false)
    end

    it 'returns true if current array includes all elements from another array with repetition but false if checking against array directly' do
      expect(array9.include_all?(*array10)).to eq(true)
      expect(array9.include_all?(array10)).to eq(false)
    end

    it 'returns true if current array includes all elements from another array with different object types' do
      expect(array11.include_all?(array12)).to eq(true)
    end

    it 'returns true if current array includes all elements from another array with unsortable object types' do
      expect(array13.include_all?(array14)).to eq(true)
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
