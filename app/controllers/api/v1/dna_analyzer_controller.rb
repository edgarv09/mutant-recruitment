class Api::V1::DnaAnalyzerController < ApplicationController
  before_action :validate_params, only: [:mutant]

  def mutant
    response = DnaAnalyzer.call(payload_to_array(dna_payload[:dna]))

    return head :ok if response.mutant?
    head :forbidden
  end

  def stats
  end

  private

  def dna_payload
    params.permit(dna: [])
  end

  def validate_params
    return head :forbidden unless valid_dna?(dna_payload[:dna])
  end
end
