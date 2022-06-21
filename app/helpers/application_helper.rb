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
    delta = (total_string_size / column_size.to_f) - column_size
    delta.zero?
  end

  def payload_to_array(payload)
    Array.new(payload.size) { |index| payload[index].chars } # rows
  end

  def ratio_mutant(human:, mutant:)
    return mutant if human.zero?

    result = (mutant/human.to_f)
    result.infinite? ? 0 : result
  end
end
