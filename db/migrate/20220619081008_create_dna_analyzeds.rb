class CreateDnaAnalyzeds < ActiveRecord::Migration[6.1]
  def change
    create_table :dna_analyzeds do |t|
      t.string :identifier, null: false
      t.jsonb :dna
      t.integer :order, default: 0

      t.timestamps
    end
  end
end
