class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts, foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  validates :name, presence: { message: 'Name can\'t be blank' }
  validates :post_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
