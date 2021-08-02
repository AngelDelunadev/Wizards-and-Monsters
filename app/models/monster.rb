class Monster < ApplicationRecord
  belongs_to :ability, optional: true
  has_many :battles
  before_validation :custom_validations

  def custom_validations
    raise 'All fields must be present' if name.blank? || element_type.blank? || hp.blank?

    raise 'Element type must be Fire, Water, or Earth' unless %w[Fire Water Earth].include? element_type

    raise 'Damage must be between 1 and 50' unless (1..100).include?(hp)
  end
end
