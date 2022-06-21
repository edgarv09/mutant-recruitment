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

    describe 'analyze a not valid payload' do
      it 'and return bad_request in case of rectangular array' do
        post "/mutant", :params => { :dna => ["ATG","CAG", "CAG", "TTA"] }
        expect(response).to have_http_status(:bad_request)
      end

      it 'and return bad_request in case of invalid_dna' do
        post "/mutant", :params => { :dna => ["ATG","CAGV"] }
        expect(response).to have_http_status(:bad_request)
      end

      it 'if entire array are empty strings' do
        post "/mutant", :params => { :dna => ["",""] }
        expect(response).to have_http_status(:bad_request)
      end

      it 'that contains numbers' do
        post "/mutant", :params => { :dna => [1, 1, "", "", 1, 1] }
        expect(response).to have_http_status(:bad_request)
      end
    end

    describe 'previously tested DNA' do
      let!(:dna_analyzed) { create(:dna_analyzed, :mutant) }

      it 'mutant dna' do
        post "/mutant", :params => { :dna => dna_analyzed.dna }

        expect(response).to have_http_status(:ok)
      end
    end
  end

  context "Stats end-point" do
    describe 'get stats' do
      it 'when there is no mutant/human analyzed' do
        get "/stats"
        expect(response.body).to eq("{\"count_mutant_dna\":0,\"count_human_dna\":0,\"ratio\":0}")
      end

      it 'mutant ratio equals to 1 in case only one mutant were analyzed' do
        create(:dna_analyzed, :mutant)
        get "/stats"
        body = JSON.parse(response.body)
        expect(body["ratio"]).to eq(1)
      end
    end
  end
end
