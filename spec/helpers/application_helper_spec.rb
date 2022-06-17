require "rails_helper"

RSpec.describe ApplicationHelper, type: :helper do
  describe "#valid_dna" do
    let(:valid_dna) { ["ATGCGA","CAGTGC","TTATGT","AGAAGG","CCCCTA","TCACTG"] }
    let(:invalid_dna) { ["ATGCGA","CHHTGC","TTATGT","AGAAGG","CCCCTA","TCACTG"] }

    it "returns true" do
      expect(helper.valid_dna?(valid_dna)).to be_truthy
    end
  end
end
