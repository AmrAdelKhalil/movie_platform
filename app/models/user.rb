class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  has_many :ratings
  has_many :movies_rated, through: :ratings, source: :movie

  has_and_belongs_to_many :watchlist, join_table: :movies_users, class_name: 'Movie'

  include Omniauthable
end
