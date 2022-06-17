require "rails_helper"

RSpec.describe Dna::Matrix, type: :service do
  context 'create a' do
    let(:test_array) { [[1,2,3],[4,5,6],[7,8,9],[10,11,12]] }
    let(:forward_diagonal) { [[1], [2, 4], [3, 5, 7], [6, 8, 10], [9, 11], [12]] }
    let(:backward_diagonal) {  [[10], [7, 11], [4, 8, 12], [1, 5, 9], [2, 6], [3]] }
    let(:columns) { [[1, 4, 7, 10], [2, 5, 8, 11], [3, 6, 9, 12]] }

    describe 'square matrix' do
      subject(:subject) { described_class.new(test_array) }

      it 'rows should be equal to source array' do
        expect(subject.rows).to match_array(test_array)
      end

      it 'columns well calculated' do
        expect(subject.columns).to match_array(columns)
      end

      it 'forward_diagonal well calculated' do
        expect(subject.forward_diagonal).to match_array(forward_diagonal)
      end

      it 'backward_diagonal well calculated' do
        expect(subject.backward_diagonal).to match_array(backward_diagonal)
      end
    end
  end
end
