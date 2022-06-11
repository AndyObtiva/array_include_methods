require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe 'ArrayIncludeMethods Opal' do
  before :all do
    RUBY_ENGINE = 'opal'
    
    load 'array_include_methods.rb'
    load 'array_include_methods/array.rb'
    
    MAIN.using ArrayIncludeMethods
  end
  
  after :all do
    RUBY_ENGINE = ORIGINAL_RUBY_ENGINE
    Object.send(:remove_const, :ArrayIncludeMethods)
    Array.undef_method(:include_any?)
    Array.undef_method(:include_all?)
  end

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
  let(:array10) { [1, 1, 2] }
  let(:array11) { [1, :a, :a, :b, 'bee', 'see', true, true, nil, nil] }
  let(:array12) { [1, :a, 'bee', true, nil] }
  let(:array13) { [1, 2, {a: 3}, {b: 4}, {c: 5}, nil] }
  let(:array14) { [1, {a: 3}, {b: 4}, nil] }
  let(:array15) { [1] }

  
  describe '#include_all?' do
    it 'returns true if current array includes all elements from another array' do
      expect(array1.include_all?(*array2)).to eq(true)
    end
  end
  
  describe '#include_any?' do
    it 'returns true if current array includes any elements from another array' do
      expect(array1.include_any?(*array3)).to eq(true)
    end
  end
  
  describe '#array_index' do
    it 'returns 1' do
      expect(array1.array_index(array2)).to eq(1)
    end
  end
end
