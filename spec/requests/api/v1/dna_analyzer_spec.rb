require 'rails_helper'

RSpec.describe "Api::V1::DnaAnalyzer", type: :request do
  context "Mutant end-point" do

    describe 'analyze valid' do
      it 'mutant dna' do
        post "/mutant", :params => { :dna => ["ATGCGA","CAGTGC","TTATGT","AGAAGG","CCCCTA","TCACTG"] }
        expect(response).to have_http_status(:no_content)
      end

      it 'human dna' do
        post "/mutant", :params => { :dna => ["ATGCGA","CAGTGC","TTATGT","AGAAGG","TGCTTA","TCACTG"] }
        expect(response).to have_http_status(:no_content)
      end
    end

    describe 'analyze bad request' do
      it 'sent a rectangular array' do
        post "/mutant", :params => { :dna => ["ATG","CAG"] }
        expect(response).to have_http_status(:forbidden)
      end
    end
  end
end
