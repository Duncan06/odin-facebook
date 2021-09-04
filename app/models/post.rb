class Post < ApplicationRecord
    has_many :comments, as: :commentable, dependent: :destroy
    has_many :likes, dependent: :destroy
end
