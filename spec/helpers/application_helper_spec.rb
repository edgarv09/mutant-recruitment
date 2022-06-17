require "rails_helper"

RSpec.describe ApplicationHelper, type: :helper do
  describe "#valid_dna" do
    let(:valid_dna) { ["ATGCGA","CAGTGC","TTATGT","AGAAGG","CCCCTA","TCACTG"] }
    let(:invalid_dna) { ["ATGCGA","CHHTGC","TTATGT","AGAAGG","CCCCTA","TCACTG"] }

    it "passing a valid dna and square matrix" do
      expect(helper.valid_dna?(valid_dna)).to be true
    end

    it 'passing a valid dna and NxM matrix' do
      valid_dna.last.concat("C")
      expect(valid_dna.last.size).to be(7)
      expect(helper.valid_dna?(valid_dna)).to be false
    end
  end
end
