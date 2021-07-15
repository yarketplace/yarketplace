class Fav < ApplicationRecord
    belongs_to :user
    belongs_to :post

    def self.num_total_images
        self.all.count
    end
end
