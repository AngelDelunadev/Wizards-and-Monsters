class AddWizardIdToBattles < ActiveRecord::Migration[6.1]
  def change
    add_reference :battles, :wizard, foreign_key: true
  end
end
