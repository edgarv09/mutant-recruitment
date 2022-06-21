FactoryBot.define do
  factory :dna_analyzed do
    dna { ["ATGCGA", "CAGTGC", "TTATGT", "AGAAGG", "CCCTTA", "TCACTG"] }
    identifier { DnaAnalyzed.dna_identifier(dna) }
    order     { 0 }

    trait :mutant do
      dna { ["ATGCGA", "CAGTGC", "TTATGT", "AGAAGG", "CCCCTA", "TCACTG"] }
      identifier { DnaAnalyzed.dna_identifier(dna) }
      order     { 1 }
    end

    trait :human do
      dna { ["ATGCGA", "CAGTGC", "TTATGT", "AGAAGG", "AGCTTA", "TCACTG"] }
      identifier { DnaAnalyzed.dna_identifier(dna) }
      order     { 0 }
    end

    trait :rand_mutant do
      dna { ["ATGCGA", "#{["A","T","G","C"].sample * 6}", "TTATGT", "AGAAGG", "#{["A","T","G","C"].sample * 6}", "TCACTG"] }
      identifier { DnaAnalyzed.dna_identifier(dna) }
      order     { 1 }
    end

    trait :rand_human do
      dna { ["ATGCGA", "#{6.times.map{ ["A","T","G","C"].sample}.join }", "TTATGT", "AGAAGG", "#{6.times.map{ ["A","T","G","C"].sample}.join }", "TCACTG"] }
      identifier { DnaAnalyzed.dna_identifier(dna) }
      order     { 0 }
    end
  end
end
