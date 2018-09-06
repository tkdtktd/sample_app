class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :microposts, dependent: :destroy
  
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed

  has_many :reverse_ralationships, foreign_key: "followed_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :reverse_relationships, # source: :follower

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: {maximum: 50}

  def feed
    Micropost.where("user_id = ?", id)
  end

  def following?(other_user)
    self.relationships.find_by(followed_id: other_user.id)
  end

  def follow!(other_user)
    # self は書いても書かなくてもいい
    self.relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    self.relationships.find_by(followed_id: other_user.id).destroy
  end
end
