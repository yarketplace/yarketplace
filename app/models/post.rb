# User -< Favs >- Post / #through fav?  

class Post < ApplicationRecord
    has_many :comments, dependent: :destroy
    has_many :favs, dependent: :destroy
    belongs_to :user
    #has_one_attached :image
    has_many :images, dependent: :destroy
    accepts_nested_attributes_for :images

    # creates a global array of acceptable categories
    def self.categories
        ["Furniture", "Books", "Other"]
    end 

    def is_fav?(user)
        user.favs.find_by(post_id: self.id)
    end

    def create_date
        date = self.created_at
        date.strftime("%B %d, %Y")
    end
end
