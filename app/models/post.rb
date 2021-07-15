class Post < ApplicationRecord
    has_many :comments, dependent: :destroy
    belongs_to :user
    has_many :images, dependent: :destroy
    accepts_nested_attributes_for :images

    # creates a global array of acceptable categories
    def self.categories
        ["Furniture", "Books", "Other"]
    end 
end
