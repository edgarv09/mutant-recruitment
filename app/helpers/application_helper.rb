module ApplicationHelper
  def valid_dna?(dna)
    valid_chars?(dna) && valid_size?(dna)
  end

  def valid_chars?(dna)
    dna.join.match?(/[ACTG]/)
  end

  def valid_size?(dna)
    column_size = dna.size
    total_string_size = dna.join.size
    (total_string_size / column_size.to_f).floor ==  column_size.to_f
  end
end
