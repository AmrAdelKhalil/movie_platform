class News < ApplicationRecord
  scope :order_by_created_at_desc, -> () { order('created_at DESC') }
end
