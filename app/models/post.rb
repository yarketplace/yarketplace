class Post < ApplicationRecord
    belongs_to :poster, :foriegn_key => :poster_id, class_name: 'User'

    has_many :comments
end
