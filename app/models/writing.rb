class Writing < ApplicationRecord
  validates :content, presence: true
  belongs_to :user
  belongs_to :composition
  
end
