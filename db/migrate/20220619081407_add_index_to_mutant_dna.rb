class AddIndexToMutantDna < ActiveRecord::Migration[6.1]
  disable_ddl_transaction!

  def up
    add_index :mutant_dnas, :identifier, unique:true, algorithm: :concurrently
  end

  def down
    remove_index :mutant_dnas, :identifier, algorithm: :concurrently
  end
end
