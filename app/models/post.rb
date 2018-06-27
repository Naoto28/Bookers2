class Post < ApplicationRecord

  belongs_to :user
  validates :opinion, length: { maximum: 200 }
  validates :title, presence: true
  validates :opinion, presence: true

end
