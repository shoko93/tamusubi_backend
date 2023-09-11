class Post < ApplicationRecord
    mount_uploader :image, ImageUploader
    has_and_belongs_to_many :tags
    has_many :post_likes, dependent: :destroy
    has_many :post_bookmarks, dependent: :destroy
    has_many :post_comments, dependent: :destroy
end
