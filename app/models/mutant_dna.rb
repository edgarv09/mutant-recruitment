class MutantDna < ApplicationRecord
  extend Forwardable
  def_delegators :MutantDna, :dna_identifier
  validates :dna, presence: true
  before_create :dna_identifier

  scope :find_mutant, ->(dna) { where(identifier: dna_identifier(dna)).take }

  def self.dna_identifier(dna)
    Digest::SHA512.hexdigest(dna.to_s)
  end

  private

  def dna_identifier
    p "dna_identifier calcular #{Digest::SHA512.hexdigest(dna.to_s)}"
    self.identifier = self.class.dna_identifier(dna)
  end

end
