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

  def call_parallel
    parallel_execution_2
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

  def parallel_execution_2
    jobs = Queue.new
    task =  %i(rows columns forward_diagonal backward_diagonal)
    task.each {|i| jobs.push i}

    workers = (POOL_SIZE).times.map do
      Thread.new do
        begin
          while method = jobs.pop(true)
            #self.send("analyze_#{method}")
            p method
            analyzer = Dna::SequenceAnalyzer.call(dna_matrix.send(method))
            @mutan_sequence_counter += analyzer.mutan_sequence_counter
          end
        rescue ThreadError => e

        end
      end
    end
    workers.map(&:join)
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
end
