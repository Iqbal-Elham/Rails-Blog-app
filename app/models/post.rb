class Post < ApplicationRecord
    belongs_to :author, class_name: 'User'
    has_many :comments
    has_many :likes

    def update_counters 
        User.find(author_id).update(post_counter: Post.where(author_id).count)
    end

    def recent_comments
        Comment.where(post_id: id).order(created_at: :desc).limit(5)
    end
end
