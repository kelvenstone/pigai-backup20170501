class Composition < ApplicationRecord
  belongs_to :user
  validates :grade, presence: true
  validates :com_title, presence: true
  validates :content, presence: true

end
