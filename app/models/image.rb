class Image < ApplicationRecord
  attachment :image
  belongs_to :composition

end
