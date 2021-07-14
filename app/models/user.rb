class User < ApplicationRecord

    has_many :posts, dependent: :destroy
    has_many :comments

    has_secure_password

    validates :email, uniqueness: true

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
end
