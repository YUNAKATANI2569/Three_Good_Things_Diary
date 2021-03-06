class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image

 has_many :diaries, dependent: :destroy
 has_many :diary_comments, dependent: :destroy
 has_many :favorites, dependent: :destroy

  validates :name, length: {maximum: 20 }, presence: true
  validates :introduction, length:{ maximum: 50 }


   #-----フォロー機能-------

  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy

  has_many :followers, through: :reverse_of_relationships, source: :follower

  has_many :followings, through: :relationships, source: :followed

  def follow(user_id)
    relationships.create(followed_id: user_id)
  end

  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end

  def following?(user)
    followings.include?(user)
  end
 #---------------



  #-----ゲストログイン-------
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲストユーザ"
    end
  end
   #----------------



# ----検索------
def self.search(search)
  if search
   User.where("name LIKE?","%#{search}%")

  else
    User.all
  end
end
# --------------
end
