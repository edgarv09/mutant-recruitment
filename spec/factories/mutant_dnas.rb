FactoryBot.define do
  factory :mutant_dna do
    dna { ["ATGCGA", "CAGTGC", "TTATGT", "AGAAGG", "CCCTTA", "TCACTG"] }
    identifier { MutantDna.dna_identifier(dna) }
    is_mutant     { false }

    trait :mutant do
      dna { ["ATGCGA", "CAGTGC", "TTATGT", "AGAAGG", "CCCCTA", "TCACTG"] }
      identifier { MutantDna.dna_identifier(dna) }
      is_mutant     { true }
    end

    trait :human do
      dna { ["ATGCGA", "CAGTGC", "TTATGT", "AGAAGG", "AGCTTA", "TCACTG"] }
      identifier { MutantDna.dna_identifier(dna) }
      is_mutant     { false }
    end

    trait :rand_mutant do
      dna { ["ATGCGA", "#{["A","T","G","C"].sample * 6}", "TTATGT", "AGAAGG", "#{["A","T","G","C"].sample * 6}", "TCACTG"] }
      identifier { MutantDna.dna_identifier(dna) }
      is_mutant     { true }
    end

    trait :rand_human do
      dna { ["ATGCGA", "#{6.times.map{ ["A","T","G","C"].sample}.join }", "TTATGT", "AGAAGG", "#{6.times.map{ ["A","T","G","C"].sample}.join }", "TCACTG"] }
      identifier { MutantDna.dna_identifier(dna) }
      is_mutant     { true }
    end
  end
end
