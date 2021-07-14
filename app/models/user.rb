class User < ApplicationRecord
    has_many :posts, dependent: :destroy 
    has_many :comments
    has_many :favs
    #has_one_attached :image
end
