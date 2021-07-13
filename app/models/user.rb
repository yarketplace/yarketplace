class User < ApplicationRecord


    has_many :posts, :foriegn_key => :poster_id
end
