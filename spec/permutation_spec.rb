require 'permutation'

RSpec.shared_examples 'permutation count' do |param|
  context 'with zeros' do
    it 'returns 1 for 100' do
      expect(Permutation.new(100, param).count).to eq 1
    end

    it 'returns 1 for 0' do
      expect(Permutation.new(0, param).count).to eq 1
    end

    it 'returns 1 for 100000' do
      expect(Permutation.new(100_000, param).count).to eq 1
    end
  end

  context 'without zeroes' do
    it 'return 12 for 1213' do
      expect(Permutation.new(1213, param).count).to eq 12
    end

    it 'return 720 for 123456' do
      expect(Permutation.new(123_456, param).count).to eq 720
    end    
  end
end

RSpec.describe Permutation, '#general' do
  include_examples 'permutation count', 'standard'
  include_examples 'permutation count', 'lexicographic_order'
end
