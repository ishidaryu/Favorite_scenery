class Genre < ApplicationRecord
 has_many :sceneries, dependent: :destroy
end
