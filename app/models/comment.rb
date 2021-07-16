class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :post

    def self.num_total_comments
        self.all.count
    end

    # display total char of comment
    def total_characters
        self.content.length
    end
    # display total words in comment
    def total_words
        self.content.split.count
    end
    # display comment create date
    def create_date
        date = self.created_at
        date.strftime("%B %d, %Y")
    end
    # display user who created comment
    def commenter
        self.user.name
    end
end
