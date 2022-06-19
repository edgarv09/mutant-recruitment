class MutantDna < ApplicationRecord
  validates :dna, presence: true
  before_create :dna_identifier

  private

  def dna_identifier
    p "dna_identifier calcular #{Digest::SHA512.hexdigest(dna.to_s)}"
    self.identifier = Digest::SHA512.hexdigest(dna.to_s)
  end
end
