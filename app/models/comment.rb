class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :post

<<<<<<< HEAD
    def self.num_total_comments
        self.all.count
    end

=======
    def total_characters
        self.count
    end

    def total_words
        self.split.count
    end
>>>>>>> 75e294faf10a9545a74ecd3a84e97a15520e1c40
end
