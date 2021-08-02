class CreateBattle < ActiveRecord::Migration[6.1]
  def change
    create_table :battles do |t|
      t.string :results
      t.timestamps
    end
  end
end
