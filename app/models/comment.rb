class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :post

    def self.num_total_comments
        self.all.count
    end

end
