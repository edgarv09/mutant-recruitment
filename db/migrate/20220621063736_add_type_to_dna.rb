class AddTypeToDna < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL
      CREATE TYPE dna_types AS ENUM ('human', 'mutant');
    SQL
    add_column :dnas, :type, :dna_types
    add_index :dnas, :type, name: 'dna_type'
  end

  def down
    remove_column :dnas, :type
    execute <<-SQL
      DROP TYPE dna_types;
    SQL
  end
end
