class Scenery < ApplicationRecord
  belongs_to :user, optional: true
  has_one_attached :scenery_image



    def get_scenrery_image(width, height)
    unless scenery_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      scenery_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      scenery_image.variant(resize_to_limit: [width, height]).processed
    end

end
