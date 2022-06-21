class Api::V1::DnaAnalyzerController < ApplicationController
  before_action :validate_params, only: [:mutant]

  def mutant
    mutant_dna = MutantDna.find_by_dna(dna_payload[:dna])
    response = if mutant_dna.present?
      mutant_response(mutant_dna.is_mutant)
    else
      dna_analisis = DnaAnalyzer.call(dna_payload[:dna])
      MutantDna.create!(dna: dna_analisis.dna, is_mutant: dna_analisis.mutant?)
      mutant_response(dna_analisis.mutant?)
    end

    return response
  end

  def stats
    render json: {"count_mutant_dna":40, "count_human_dna":100, "ratio":0.4}, status: :ok
  end

  private

  def mutant_response(is_mutant)
    head (is_mutant ? :ok : :forbidden)
  end

  def dna_payload
    params.permit(dna: [])
  end

  def validate_params
    return head :bad_request unless valid_dna?(dna_payload[:dna])
  end
end
