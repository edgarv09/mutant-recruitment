FactoryBot.define do
  factory :mutant_dna do
    dna { ["ATGCGA", "CAGTGC", "TTATGT", "AGAAGG", "CCCTTA", "TCACTG"] }
    identifier { MutantDna.dna_identifier(dna) }
    is_mutant     { false }

    trait :mutant do
      dna { ["ATGCGA", "CAGTGC", "TTATGT", "AGAAGG", "CCCTTA", "TCACTG"] }
      identifier { MutantDna.dna_identifier(dna) }
      is_mutant     { true }
    end

    trait :human do
      dna { ["ATGCGA", "CAGTGC", "TTATGT", "AGAAGG", "CCCCTA", "TCACTG"] }
      identifier { MutantDna.dna_identifier(dna) }
      is_mutant     { false }
    end
  end
end
