class Battle < ApplicationRecord
  belongs_to :wizard
  belongs_to :monster
end