class CreateMutantDnas < ActiveRecord::Migration[6.1]
  def change
    create_table :mutant_dnas do |t|
      t.string :identifier
      t.jsonb :dna
      t.boolean :is_mutant, default: false

      t.timestamps
    end
  end
end
