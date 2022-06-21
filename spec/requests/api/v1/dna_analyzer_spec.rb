require 'rails_helper'

RSpec.describe "Api::V1::DnaAnalyzer", type: :request do
  context "Mutant end-point" do

    describe 'analyze valid' do
      it 'mutant dna' do
        post "/mutant", :params => { :dna => ["ATGCGA","CAGTGC","TTATGT","AGAAGG","CCCCTA","TCACTG"] }
        expect(response).to have_http_status(:ok)
      end

      it 'human dna' do
        post "/mutant", :params => { :dna => ["ATGCGA","CAGTGC","TTATGT","AGAAGG","TGCTTA","TCACTG"] }
        expect(response).to have_http_status(:forbidden)
      end
    end

    describe 'analyze bad request' do
      it 'return bad_request in case of rectangular array' do
        post "/mutant", :params => { :dna => ["ATG","CAG", "CAG", "TTA"] }
        expect(response).to have_http_status(:bad_request)
      end

      it 'return bad_request in case of invalid_dna' do
        post "/mutant", :params => { :dna => ["ATG","CAGV"] }
        expect(response).to have_http_status(:bad_request)
      end

      it 'dna payload is all empty strings' do
        post "/mutant", :params => { :dna => ["",""] }
        expect(response).to have_http_status(:bad_request)
      end

      it 'dna payload contains numbers' do
        post "/mutant", :params => { :dna => [1, 1, "", "", 1, 1] }
        expect(response).to have_http_status(:bad_request)
      end
    end

    describe 'previously tested DNA' do
      let!(:mutant_dna) { create(:mutant_dna, :mutant) }

      it 'mutant dna' do
        post "/mutant", :params => { :dna => mutant_dna.dna }

        expect(response).to have_http_status(:ok)
      end
    end
  end
end
