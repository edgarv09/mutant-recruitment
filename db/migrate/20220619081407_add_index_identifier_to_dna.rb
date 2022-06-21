class AddIndexIdentifierToDna < ActiveRecord::Migration[6.1]
  disable_ddl_transaction!

  def up
    add_index :dna_analyzeds, :identifier, unique:true, algorithm: :concurrently
  end

  def down
    remove_index :dna_analyzeds, :identifier, algorithm: :concurrently
  end
end
