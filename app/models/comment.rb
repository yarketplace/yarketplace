class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :post

    def total_characters
        self.count
    end

    def total_words
        self.split.count
    end
end
