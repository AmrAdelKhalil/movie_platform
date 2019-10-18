class Rating < ApplicationRecord
  RATE_SCALE = 5

  belongs_to :user
  belongs_to :movie
end
