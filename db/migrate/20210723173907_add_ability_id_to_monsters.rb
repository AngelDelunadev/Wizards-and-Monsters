class AddAbilityIdToMonsters < ActiveRecord::Migration[6.1]
  def change
    add_reference :monsters, :ability, foreign_key: true
  end
end
