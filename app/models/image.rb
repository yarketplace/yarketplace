class Image < ApplicationRecord
    # belongs_to :post
    has_one_attached :uploaded_image
    #comment
    validates :uploaded_image, presence: true
end
