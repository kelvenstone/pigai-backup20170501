class Composition < ApplicationRecord
  belongs_to :user
  validates :grade, presence: true
  validates :content, presence: true

end
