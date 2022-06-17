module ApplicationHelper
  def valid_dna?(dna)
    dna.join.match?(/[abc]/)
  end
end
