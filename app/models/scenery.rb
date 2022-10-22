class Scenery < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :genre

  has_many :favorites, dependent: :destroy
  has_many :scenery_comments, dependent: :destroy

  has_one_attached :scenery_image

  def favorited_by?(user)
      favorites.where(user_id: user.id).exists?
  end

  def get_scenrery_image
    unless scenery_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      scenery_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      scenery_image
  end


  def self.looks(search, word)
    if search == "perfect_match"
      @scenery = Scenery.where("name LIKE?","#{word}")
    elsif search == "forward_match"
      @scenery = Scenery.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @scenery = Scenery.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @scenery = Scenery.where("name LIKE?","%#{word}%")
    else
      @scenery = Scenery.all
    end
  end
end
