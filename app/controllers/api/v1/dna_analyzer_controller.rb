class Api::V1::DnaAnalyzerController < ApplicationController
  before_action :validate_params, only: [:mutant]

  def mutant
    response = DnaAnalyzer.new(payload_to_array(dna_payload)).call

    return head :ok if response.mutant?
    head :forbidden
  end

  private

  def dna_payload
    params.require(:dna)
  end

  def validate_params
    return head :forbidden unless valid_dna?(dna_payload)
  end
end
