module Dna
  class SequenceAnalyzer < ApplicationService
    MUTANT_SEQUENCE_SIZE = 4
    attr_reader :dna_sequences, :mutan_sequence_counter

    def initialize(dna_sequences)
      @dna_sequences = dna_sequences
      @mutan_sequence_counter = 0
    end

    def call
      dna_sequences.each do |sequence|
        find_mutant_sequences(sequence)
      end
      self
    end

    alias :perfom :call

    private

    def mutant_sequence_finded
      @mutan_sequence_counter+=1
    end

    def find_mutant_sequences(sequence)
      size = sequence.size
      return if size < MUTANT_SEQUENCE_SIZE

      pivot = 0
      more_sequences = true

      while more_sequences do
        temp_sequence = sequence.slice(pivot, MUTANT_SEQUENCE_SIZE)
        #p "movimiento start: #{pivot}"
        #p temp_sequence
        break if temp_sequence.size < 4
        if temp_sequence.uniq.size == 1
          mutant_sequence_finded
          #p "sequencia encontrada #{temp_sequence}, counter: #{@mutan_sequence_counter}"
          more_sequences = false
          pivot + 3
        else
          pivot += 1
        end
      end
    end

  end
end
