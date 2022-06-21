class DnaAnalyzer < ApplicationService
  include ApplicationHelper
  attr_reader :dna_matrix, :dna
  MUTANT_SEQUENCE_SIZE = 4

  POOL_SIZE = 10
  def initialize(dna)
    @dna = dna
    @dna_matrix = Dna::Matrix.new(payload_to_array(@dna))
    @mutan_sequence_counter = 0
  end

  def call
    sequencial_execution
    self
  end

  def mutant?
    @mutan_sequence_counter > 2
  end

  def sequencial_execution
    task =  %i(rows columns forward_diagonal backward_diagonal)
    task.each do |task|
      analyzer = Dna::SequenceAnalyzer.call(dna_matrix.send(task))
      @mutan_sequence_counter+= analyzer.mutan_sequence_counter
    end
  end
end
