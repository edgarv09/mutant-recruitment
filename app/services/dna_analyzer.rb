class DnaAnalyzer < ApplicationService
  attr_reader :dna_matrix
  MUTANT_SEQUENCE_SIZE = 4

  POOL_SIZE = 4
  def initialize(dna)
    @dna_matrix = Dna::Matrix.new(dna)
    @mutan_sequence_counter = 0
  end

  def call
    parallel_execution
    self
  end

  def mutant?
    @mutan_sequence_counter > 2
  end

  private

  def default_execution
    task =  %i(rows columns forward_diagonals backward_diagonals)
    task.each {|i| self.send("analyze_#{i}") }
  end

  def parallel_execution
    jobs = Queue.new
    task =  %i(rows columns forward_diagonals backward_diagonals)
    task.each {|i| jobs.push i}

    workers = (POOL_SIZE).times.map do
      Thread.new do
        begin
          while method = jobs.pop(true)
            self.send("analyze_#{method}")
          end
        rescue ThreadError => e

        end
      end
    end
    workers.map(&:join)
  end

  def anylze_sequence(dna_sequences)
    dna_sequences.each do |sequence|
      find_mutant_sequences(sequence)
    end
  end

  def analyze_rows
    @dna_matrix.rows.each do |sequence|
      find_mutant_sequences(sequence)
       p __method__
    end
  end

  def analyze_columns
    @dna_matrix.columns.each do |sequence|
      find_mutant_sequences(sequence)
       p __method__
    end
  end

  def analyze_forward_diagonals
    @dna_matrix.forward_diagonal.each do |sequence|
      find_mutant_sequences(sequence)
       p __method__
    end
  end

  def analyze_backward_diagonals
    @dna_matrix.backward_diagonal.each do |sequence|
      find_mutant_sequences(sequence)
       p __method__
    end
  end

  def mutant_sequence_finded
    @mutan_sequence_counter+=1
  end

  def find_mutant_sequences(sequence)
    size = sequence.size
    return false if size < MUTANT_SEQUENCE_SIZE

    pivot = 0
    more_sequences = true

    while more_sequences do
      temp_sequence = sequence.slice(pivot, MUTANT_SEQUENCE_SIZE)
      p "movimiento start: #{pivot}"
      p temp_sequence
      break if temp_sequence.size < 4
      if temp_sequence.uniq.size == 1
        mutant_sequence_finded
        p "sequencia encontrada #{temp_sequence}, counter: #{@mutan_sequence_counter}"
        more_sequences = false
        pivot + 3
      else
        pivot += 1
      end
    end
  end

end
