# User -< Favs >- Post / #through fav?  

class User < ApplicationRecord
    has_many :posts, dependent: :destroy  
    has_many :comments, dependent: :destroy  
    has_many :favs, dependent: :destroy  

    has_secure_password

    validates :email, uniqueness: true, presence: true
    validates :location, presence: true
    validates :address, presence: true
    validates :zip_code, presence: true
    validates :phone_number, presence: true
    validates :name, presence: true

    def self.location_options
        [
            ["East Rock"], # what other off-campus areas?
            ["Yale College: Old Campus", "Old Campus"],
            ["Yale College: Benjamin Franklin", "Benjamin Franklin"],
            ["Yale College: Berkeley", "Berkeley"],
            ["Yale College: Branford", "Branford"],
            ["Yale College: Davenport", "Davenport"],
            ["Yale College: Ezra Stiles", "Ezra Stiles"],
            ["Yale College: Grace Hopper", "Grace Hopper"],
            ["Yale College: Jonathan Edwards", "Jonathan Edwards"],
            ["Yale College: Morse", "Morse"],
            ["Yale College: Pauli Murray", "Pauli Murray"],
            ["Yale College: Pierson", "Pierson"],
            ["Yale College: Saybrook", "Saybrook"],
            ["Yale College: Silliman", "Silliman"],
            ["Yale College: Timothy Dwight", "Timothy Dwight"],
            ["Yale College: Trumball", "Trumball"],
            ["Other"]
        ]
    end

    def num_faved_posts
        self.favs.count
    end

    def faved_posts_names
        self.posts.map { |post| post.is_fav?(self) }
    end

    def self.total_num_users
        self.all.count
    end

    def create_date
        date = self.created_at
        date.strftime("%B %d, %Y")
    end
end
