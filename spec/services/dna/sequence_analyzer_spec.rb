require "rails_helper"

RSpec.describe Dna::SequenceAnalyzer, type: :service do
  context 'Analyze dna sequences' do

    describe 'with different sizes' do
      let(:test_array) {  [["T"], ["C", "C"], ["A", "C", "A"], ["T", "G", "C", "C"], ["C", "T", "A", "C", "T"], ["A", "A", "A", "A", "T", "G"], ["T", "G", "T", "G", "A"], ["G", "T", "G", "G"], ["C", "G", "T"], ["G", "C"], ["A"]] }
      subject(:subject) { described_class.new(test_array).call }

      it "should find 1 mutant sequence" do
        expect(subject.mutan_sequence_counter).to be(1)
      end
    end
  end
end
