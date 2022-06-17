module ApplicationHelper
  def valid_dna?(dna)
    dna.join.match?(/[ACTG]/)
  end
end
