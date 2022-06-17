class Api::V1::DnaAnalyzerController < ApplicationController
  before_action :validate_params, only: [:mutant]

  def mutant

  end

  private

  def dna
    params.require(:dna)
  end

  def validate_params
    return head :forbidden unless valid_dna?(dna)
  end
end
