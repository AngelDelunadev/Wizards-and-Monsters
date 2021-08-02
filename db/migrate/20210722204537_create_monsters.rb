class CreateMonsters < ActiveRecord::Migration[6.1]
  def change
    create_table :monsters do |t|
      t.string :name
      t.string :element_type
      t.integer :hp
      t.timestamps
    end
  end
end
