class AddMonsterIdToBattles < ActiveRecord::Migration[6.1]
  def change
    add_reference :battles, :monster, foreign_key: true
  end
end
