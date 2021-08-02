class CreateAbilities < ActiveRecord::Migration[6.1]
  def change
    create_table :abilities do |t|
      t.string :name
      t.string :element_type
      t.integer :damage
      t.timestamps
    end
  end
end
