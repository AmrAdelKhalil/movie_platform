class News < ApplicationRecord
  scope :order_by_created_at_desc, -> () { order('created_at DESC') }
  scope :by_description, -> (content) { where("description LIKE :content", content: "%#{content}%") unless content.nil? }
end
