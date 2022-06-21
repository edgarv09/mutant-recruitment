class AddIndexIdentifierToDna < ActiveRecord::Migration[6.1]
  disable_ddl_transaction!

  def up
    add_index :dnas, :identifier, unique:true, algorithm: :concurrently
  end

  def down
    remove_index :dnas, :identifier, algorithm: :concurrently
  end
end
