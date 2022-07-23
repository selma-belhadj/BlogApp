class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :post, class_name: 'Post', foreign_key: :user_id, dependent: :destroy
  has_many :comment, class_name: 'Comment', foreign_key: :user_id, dependent: :destroy
  has_many :like, class_name: 'Like', foreign_key: :user_id, dependent: :destroy

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def three_recent_posts
    post.includes(:user).order(created_at: :desc).limit(3)
  end
  def generate_jwt
    JWT.encode({ id:, exp: 60.days.from_now.to_i }, Rails.application.secrets.secret_key_base)
  end
end
