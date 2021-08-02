class AddAbilityIdToWizards < ActiveRecord::Migration[6.1]
  def change
    add_reference :wizards, :ability, foreign_key: true
  end
end
