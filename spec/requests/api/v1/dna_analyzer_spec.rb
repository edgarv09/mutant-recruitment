require 'rails_helper'

RSpec.describe "Api::V1::DnaAnalyzer", type: :request do
  context "POST /mutant" do
    it "creates a Widget" do
      post "/mutant", :params => { :dna => ["ATGCGA","CAGTGC","TTATGT","AGAAGG","CCCCTA","TCACTG"] }
      expect(response).to have_http_status(:no_content)
    end
  end
end
