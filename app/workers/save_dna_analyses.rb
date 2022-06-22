class SaveDnaAnalyses
  include Sidekiq::Worker

  def initialize(dna, order)
    @dna = dna
    @order = order
  end

  def perform
    DnaAnalyzed.create!(dna: dna, order: order)
  end
end
