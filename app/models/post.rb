# User -< Favs >- Post / #through fav?  

class Post < ApplicationRecord
    has_many :comments, dependent: :destroy
    has_many :favs, dependent: :destroy
    belongs_to :user
    #has_one_attached :image
    has_many :images, dependent: :destroy
    accepts_nested_attributes_for :images

    validates :title, presence: true
    validates :category, presence: true
    validates :price, presence: true 
    validates :desc, presence: true

    # creates a global array of acceptable categories
    def self.categories
        ["Furniture", "Books", "Other"]
    end 
    # return true if post is faved by current user
    def is_fav?(user)
        user.favs.find_by(post_id: self.id)
    end
    # return post create date
    def create_date
        date = self.created_at
        date.strftime("%B %d, %Y")
    end
    # return number of comments on a post
    def num_comments
        self.comments.count
    end

    def self.total_num_posts
        self.all.count
    end
    # return array of all posts ordered by most recent
    def self.order_by_most_recent
        self.all.order(created_at: :desc)
    end
    # return when a post was faved
    def faved_date(user)
        if self.is_fav?(user)
            Fav.find_by(post_id: self.id).create_date
        end
    end

    def get_user_name
        self.user.name
    end

    def get_user_email
        self.user.email
    end

    def get_user_phone
        self.user.phone_number
    end
end
