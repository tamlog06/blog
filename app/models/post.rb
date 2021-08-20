class Post < ApplicationRecord
    has_many :comments, dependent: :destroy
    # @post.comments で引っ張ってこれる
    validates :title, presence: true, length: {minimum: 3, message: 'Too short to post!'}
    validates :body, presence: true
end
