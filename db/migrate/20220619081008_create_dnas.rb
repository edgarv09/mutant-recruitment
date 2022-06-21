class CreateDnas < ActiveRecord::Migration[6.1]
  def change
    create_table :dnas do |t|
      t.string :identifier, null: false
      t.jsonb :dna
      t.boolean :is_mutant, default: false

      t.timestamps
    end
  end
end
