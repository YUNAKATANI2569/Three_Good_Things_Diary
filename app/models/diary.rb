class Diary < ApplicationRecord

 belongs_to :user, optional: true
  has_many :diary_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :body, presence: true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
